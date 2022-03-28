import { observer } from 'mobx-react-lite'
import React, { useContext, useEffect, useState } from 'react'
import { Col, Container, Image, Row, Spinner } from 'react-bootstrap'
import { Swiper, useSwiper, SwiperSlide } from 'swiper/react';
import 'swiper/css';
import { Context } from '..'
import DeviceItem from '../components/DeviceItem'
import { fetchUser, fetchDevice, fetchHistoryDevices } from '../services/ApiProvider'

export const UserPage = observer(() => {

  const {device, user} = useContext(Context) 

  let array = [];

  function name() {
    fetchHistoryDevices(user.id).then(data => {
      
      device.setHistoryDevices(data)
  
      if(data == null) {
        device.setHistory(array)
      } else {
        device.historyDevices.map(d => {
          fetchDevice(d.deviceId).then(data => {
            array.push(data);
            device.setHistory(array);
          })
        })
      }
  
    })
  }

  useEffect(() => {

    console.log(user);

    fetchUser(user.id).then((data) => {
      user.setName(data.name)
      user.setEmail(data.email)
    })

    name();

  }, [])
  
  return (
    <Container className='mt-3'>
      <Row>
        <Col md={6}>
          <Row>
            <Col md={6}>
              <Image height={300} />
            </Col>
            <Col md={6}>
              <Row className='px-3'>
                Имя пользователя: {user.name}
              </Row>
              <Row className='px-3'>
                Почта пользователя: {user.email}
              </Row>
            </Col>
          </Row>
        </Col>
      </Row>
      <h1  className='mt-3'>История покупок</h1>
      <Swiper
        spaceBetween={10}
        slidesPerView={window.innerWidth > 1024 ? 8 : 2}
        slidesPerGroup={2}
        scrollbar={{ draggable: true }}
      >
        <Row>
          {device.history.map(d  => 
            <SwiperSlide>
              <DeviceItem
                key={d.id}
                device={d}
                size={12}
              />
            </SwiperSlide>
          )}
        </Row>
      </Swiper>
    </Container>
  )
})