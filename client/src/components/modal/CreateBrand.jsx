import React, { useState, useContext } from 'react'
import { Button, Form, Modal, Dropdown, Row } from 'react-bootstrap'
import DropdownItem from 'react-bootstrap/esm/DropdownItem';
import DropdownMenu from 'react-bootstrap/esm/DropdownMenu';
import DropdownToggle from 'react-bootstrap/esm/DropdownToggle';
import { createBrand, deleteBrand } from '../../services/ApiProvider';
import { Context } from '../../index'
import { observer } from 'mobx-react-lite';

export const CreateBrand = observer(({show, onHide}) => {

  const {device} = useContext(Context)

  const [value, setValue] = useState('');

  function addBrand() {
    createBrand({name: value}).then(data => {
      setValue('');
      onHide();
    })
  }

  function delBrand() {
    deleteBrand(device.selectedBrand.id).then(data => {
      onHide();
    })
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
          Добавить бренд
        </Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Form className='d-flex gap-2 mb-2'>
          <Form.Control 
            placeholder='Введите название типа'
            value={value}
            onChange={e => setValue(e.target.value)}
          />
          <Button variant='success' onClick={addBrand}>Добавить</Button>
        </Form>
        <Form className='d-flex gap-2'>
          <Dropdown className="w-100">
            <DropdownToggle variant='outline' className="w-100">{device.selectedBrand.name || 'Выберите бренд'}</DropdownToggle>
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
          <Button variant='danger' onClick={delBrand}>Удалить</Button>
        </Form>
      </Modal.Body>
    </Modal>
  )
})