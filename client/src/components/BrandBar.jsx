import { observer } from 'mobx-react-lite';
import React, { useContext } from 'react'
import { Card, Row } from 'react-bootstrap';
import { Context } from '../index';
import { Swiper, useSwiper, SwiperSlide } from 'swiper/react';
import 'swiper/css';

export const BrandBar = observer(() => { 

  const {device} = useContext(Context);

  return (
    <Swiper
      spaceBetween={10}
      slidesPerView={window.innerWidth > 1024 ? 10 : 4}
      slidesPerGroup={4}
      scrollbar={{ draggable: true }}
    >
      
        <Row>
          {device.brands.map(b => 
            <SwiperSlide>
              <Card
                key={b.id}
                onClick={() => {
                  if(device.selectedBrand.id === b.id) {
                    device.setSelectedBrand([])
                  } else {
                    device.setSelectedBrand(b)
                  }
                }}
                border={b.id === device.selectedBrand.id ? 'primary' : 'dark'}
                className='p-3 justify-content-center align-items-center'
                style={{cursor: 'pointer', width: 'auto'}}
              >
                {b.name}
              </Card>
            </SwiperSlide>
          )}
        </Row>
     
    </Swiper>
  )
})