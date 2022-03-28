import { observer } from 'mobx-react-lite';
import React, { useContext, useEffect, useState } from 'react'
import { Button, Form, Modal, Dropdown, FormControl, Row, Col } from 'react-bootstrap'
import DropdownItem from 'react-bootstrap/esm/DropdownItem';
import DropdownMenu from 'react-bootstrap/esm/DropdownMenu';
import DropdownToggle from 'react-bootstrap/esm/DropdownToggle';
import { Context } from '../../index'
import { createDevice, fetchBrands, fetchTypes, fetchDevices } from '../../services/ApiProvider';

export const CreateDevice = observer(({show, onHide}) => {

    const {device} = useContext(Context)
    const [name, setName] = useState('')
    const [price, setPrice] = useState()
    const [file, setFile] = useState(null)
    const [info, setInfo] = useState([])
  
    useEffect(() => {
      fetchTypes().then(data => device.setTypes(data))
      fetchBrands().then(data => device.setBrands(data))
  }, [])

  const addInfo = () => {
      setInfo([...info, {title: '', description: '', number: Date.now()}])
  }
  const removeInfo = (number) => {
      setInfo(info.filter(i => i.number !== number))
  }
  const createInfo = (key, value, number) => {
      setInfo(info.map(i => i.number === number ? {...i, [key]: value} : i))
  }

  const selectFile = e => {
      setFile(e.target.files[0])
  }

  const addDevice = () => {
      const formData = new FormData()
      formData.append('name', name)
      formData.append('price', `${price}`)
      formData.append('img', file)
      formData.append('brandId', device.selectedBrand.id)
      formData.append('typeId', device.selectedType.id)
      formData.append('info', JSON.stringify(info))
      createDevice(formData).then(data => onHide())
  }
  
    return (
      <Modal
        show={show}
        onHide={onHide}
        size="lg"
        centered
      >
        <Modal.Header closeButton>
          <Modal.Title id="contained-modal-title-vcenter">
            Добавить устройство
          </Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form>
            <Dropdown>
              <DropdownToggle variant='outline' className="w-100 mb-2">{device.selectedType.name || 'Выберите тип'}</DropdownToggle>
              <DropdownMenu className="w-100">
                {device.types.map(t => 
                  <DropdownItem 
                    key={t.id}
                    onClick={() => device.setSelectedType(t)}
                  >
                    {t.name}
                  </DropdownItem>
                )}
              </DropdownMenu>
            </Dropdown>
            <Dropdown>
              <DropdownToggle variant='outline' className="w-100 mb-2">{device.selectedBrand.name || 'Выберите бренд'}</DropdownToggle>
              <DropdownMenu className="w-100">
                {device.brands.map(b => 
                  <DropdownItem 
                    key={b.id}
                    onClick={() => device.setSelectedBrand(b)}
                  >
                    {b.name}
                  </DropdownItem>
                )}
              </DropdownMenu>
            </Dropdown>
            <FormControl 
              placeholder='Введите название устройства' 
              className='mb-2' 
              value={name}
              onChange={e => setName(e.target.value)}
            />
            <FormControl 
              placeholder='Введите стоимость устройства' 
              className='mb-2' 
              type="number" 
              value={price}
              onChange={e => setPrice(Number(e.target.value))}
            />
            <FormControl className='mb-2' type="file" onChange={selectFile} />
            <hr />
            {
              info.map(i =>
                <Row key={i.number}>
                  <Col md={4} className='my-2'>
                    <FormControl 
                      placeholder='Введите название свойства' 
                      value={i.title}
                      onChange={(e) => createInfo('title', e.target.value, i.number)}
                    />
                  </Col>
                  <Col md={7} className='my-2'>
                    <FormControl 
                      placeholder='Введите описание свойства' 
                      value={i.description}
                      onChange={(e) => createInfo('description', e.target.value, i.number)}
                    />
                  </Col>
                  <Col md={1} className='my-2 d-flex justify-content-end'>
                    <Button variant='danger' className='w-100' onClick={() => removeInfo(i.number)}>x</Button>
                  </Col>
                </Row>
              )
            }
            <Button onClick={addInfo}>Добавить новое свойство</Button>
          </Form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant='success' onClick={addDevice}>Добавить</Button>
          <Button variant='outline-danger' onClick={onHide}>Закрыть</Button>
        </Modal.Footer>
      </Modal>
    )
  }  
)