import { observer } from 'mobx-react-lite'
import React, { useContext, useEffect, useMemo, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { FormControl, Row } from 'react-bootstrap'
import { Context } from '..'
import { fetchSearchDevices } from '../services/ApiProvider'

export const Search = observer(() => {

  const {device} = useContext(Context) 
  
  const [search, setSearch] = useState('')

  const [visible, setVisible] = useState(false)

  const navigate = useNavigate();

  const searchArray = useMemo(() => {
    return device.searchDevices.filter(d => d.name.toLowerCase().includes(search.toLowerCase()))
  }, [search, device.searchDevices])

  useEffect(() => {

    fetchSearchDevices().then((data) => {
      device.setSearchDevices(data)
    })
    
  }, [])

  return (
    <Row>
      <FormControl 
      style={{position: 'relative'}}
        placeholder='Введите название устройства' 
        className='mb-2' 
        value={search}
        onChange={(e)=> {
          setSearch(e.target.value);
          if(e.target.value == '') {
            setVisible(false)
          } else {
            setVisible(true)
          }
        }}
      />
      {
        visible
        ?
        <div style={{position: 'absolute', marginTop: 40, background: 'white', zIndex: 20, border: '1px solid black', maxWidth: window.innerWidth / 1.5, maxHeight: window.innerHeight / 2, overflow: 'auto'}}>
          {searchArray.map(d=>
            <p style={{cursor: 'pointer'}} onClick={() => navigate('/device' + '/' + d.id)}>
              {
                d.name
              }
            </p>)
          }
        </div>
        :
        null
      }
    </Row>
  )
})
