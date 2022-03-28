import { observer } from 'mobx-react-lite';
import React, { useContext } from 'react'
import { Card, Row } from 'react-bootstrap';
import { Context } from '../index';
import DeviceItem from './DeviceItem';

export const DeviceList = observer(() => { 

  const {device} = useContext(Context);

  return (
    <Row className='mt-3'>
      {device.devices.map(d  => 
        <DeviceItem
          key={device.id}
          device={d}
          size={3}
        />
      )}
    </Row>
  )
})