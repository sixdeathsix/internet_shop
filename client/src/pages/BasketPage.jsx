import { observer } from 'mobx-react-lite'
import React, { useEffect, useContext, useState } from 'react'
import { Button, Card, Col, Container, Form, Row } from 'react-bootstrap'
import { useParams  } from 'react-router-dom'
import { addHistoryDeviceArray, fetchBasketDevices, fetchDevice } from '../services/ApiProvider'
import { Context } from '../index'
import DeviceItem from '../components/DeviceItem'
import { deleteBasketDevice } from '../services/ApiProvider'
import AccordionBody from 'react-bootstrap/esm/AccordionBody'

export const BasketPage = observer(() => {

  const {device, user} = useContext(Context)

  let array = [];

  function addArray() {
    addHistoryDeviceArray(user.id, device.basket)
    device.basket.map(
      d => deleteBasketDevice(user.id, d.id).then(() => device.setBasket(array)).finally(() => name())
    )
  }

  function name() {
    fetchBasketDevices(user.id).then(data => {
      
      device.setBasketDevices(data)
  
      if(data == null) {
        device.setBasket(array)
      } else {
        device.basketDevices.map(d => {
          fetchDevice(d.deviceId).then(data => {
            array.push(data)
            device.setBasket(array)
          })
        })
      }
  
    })
  }

  useEffect(() => {

    name();

  }, [])
  
  function deleteDevice(id) {
    deleteBasketDevice(user.id, id).then(() => {
      device.setBasket(array)
      name()
    })
  }

  return (
    <Container className='mt-3'>
      <Row>
        <Col md={9}>
          <Row>
            {device.basket.map(d  => 
              <DeviceItem
                key={d.id}
                device={d}
                size={2}
                callback={() => deleteDevice(d.id)}
              />
            )}
          </Row>
        </Col>
        <Col md={3}>
          <Card>
            <Card.Body>
              <p className='d-flex justify-content-center' style={{fontSize: 36}}>
                {device.basket.reduce(
                  (a, b) => a + b.price, 0
                )} ₽
              </p>
              <div>
                <Button className='w-100' onClick={addArray}>Оформить заказ</Button>
              </div>
            </Card.Body>
          </Card>
        </Col>
      </Row>
    </Container>
  )
})