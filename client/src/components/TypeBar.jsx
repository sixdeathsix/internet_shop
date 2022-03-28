import React, { useContext } from 'react'
import { observer } from "mobx-react-lite"
import { Context } from '../index'
import { ListGroup } from 'react-bootstrap';

export const TypeBar = observer(() => {

  const {device} = useContext(Context);

  return (
    <ListGroup className='mb-3'>
      {device.types.map(t => 
        <ListGroup.Item 
          key={t.id}
          onClick={() => {
            if(device.selectedType.id === t.id){
              device.setSelectedType({})
            } else {
              device.setSelectedType(t)
            }
          }}
          active={t.id === device.selectedType.id}
          style={{cursor: 'pointer'}}
        >
          {t.name}
        </ListGroup.Item>
      )}
    </ListGroup>
  )
})