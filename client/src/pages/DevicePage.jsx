import React, { useState, useEffect, useContext } from 'react'
import { Col, Container, Image, Row, Button } from 'react-bootstrap'
import { useParams, useNavigate } from 'react-router-dom'
import { addBasketDevice, fetchDevice, URL, deleteDevice, addHistoryDevice } from '../services/ApiProvider'
import { Context } from '../index'

export default function DevicePage() {

  const {user} = useContext(Context)

  const [device, setDevice] = useState({info: []})
  const {id} = useParams()

  let navigate = useNavigate()

  function addDevice() {
    addBasketDevice(user.id, Number(id))
  }

  function buyDevice() {
    addHistoryDevice(user.id, Number(id))
  }

  function delDevice() {
    deleteDevice(id)
    navigate('/')
  }
  
  useEffect(() => {
    fetchDevice(id).then(data => setDevice(data))
  }, [])
  

  return (
    <Container>
      <Row className='mt-3'>
        <Col md={4}>
          <Image style={{height: '50vh'}} src={URL + device.img} />
        </Col>
        <Col md={8}>
          <div><p style={{fontWeight: 400, fontSize: 36}}>{device.name}</p></div>
          <div className='d-flex align-items-center'>{device.rating}</div>
          <div><p style={{fontWeight: 400, fontSize: 48}}>{device.price} ₽</p></div>
          <div>
            <Button onClick={buyDevice}>Купить</Button>
            <Button className='m-2' variant="outline-primary" onClick={addDevice}>В корзину</Button>
            {
              user.role === 'ADMIN' 
              ?
              <Button className='m-2' variant="outline-danger" onClick={delDevice}>Удалить</Button>
              :
              null
            }
          </div>
        </Col>
      </Row>
      <Row>
        <h2 className='my-4'>Характеристики {device.name}</h2>
        {device.info.map(info =>
          <Row>
            <Col lg={6}  className='d-flex justify-content-between'>
              <Col><p style={{color: 'gray'}}>{info.title}</p></Col><Col>{info.description}</Col>
            </Col>
          </Row>
        )}
      </Row>
    </Container>
  )
}