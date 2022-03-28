import React, { useContext } from 'react'
import { Button, Card, Col, Image } from 'react-bootstrap'
import rating from '../assets/rating.png'
import { useNavigate, useLocation  } from 'react-router-dom'
import {URL} from '../services/ApiProvider'
import { Context } from '..'

export default function ({device, size, callback, count}) {

  const {user} = useContext(Context)
  
  const navigate = useNavigate();
  const isBasket = useLocation().pathname === '/basket';

  return (
    <Col md={size} className='mb-3'>
      <Card
        style={{cursor: 'pointer'}}
        className='p-3'
      >
        <div onClick={() => navigate('/device' + '/' + device.id)}>
          <Image style={{height: 150}} src={URL + device.img} />
          <div className='d-flex justify-content-between align-items-center mt-3'>
            <div className='d-flex align-items-center'>
              <div>{device.rating}</div>
              <Image width={16} height={16} src={rating} />
            </div>
          </div>
          <div><p style={{whiteSpace: 'nowrap', textOverflow: 'ellipsis', width: '100%', overflow: 'hidden', margin: 0}}>{device.name}</p></div>
          <div>{device.price} ₽</div>
        </div>
        {
          isBasket
          ?
          <div>
            <div>{count}</div>
            <Button onClick={callback}>удалить</Button>
          </div>
          :
          null
        }
      </Card>
    </Col>
  )
}
