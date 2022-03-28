import React, { useState } from 'react'
import { Container, Button } from 'react-bootstrap'
import {CreateBrand} from '../components/modal/CreateBrand'
import {CreateDevice} from '../components/modal/CreateDevice'
import {CreateType} from '../components/modal/CreateType'

export default function AdminPage() {

  const [typeVisible, setTypeVisible] = useState(false);
  const [brandVisible, setBrandVisible] = useState(false);
  const [deviceVisible, setDeviceVisible] = useState(false);

  return (
    <Container className='mt-3'>
      <Button
        className='w-100 my-2'
        onClick={() => setTypeVisible(true)}
      >
        Управление типами
      </Button>
      <Button
        className='w-100 my-2'
        onClick={() => setBrandVisible(true)}
      >
        Управление брендами
      </Button>
      <Button
        className='w-100 my-2'
        onClick={() => setDeviceVisible(true)}
      >
        Добавить устройство
      </Button>
      <CreateType show={typeVisible} onHide={() => setTypeVisible(false)}/>
      <CreateBrand show={brandVisible} onHide={() => setBrandVisible(false)} />
      <CreateDevice show={deviceVisible} onHide={() => setDeviceVisible(false)} />
    </Container>
  )
}
