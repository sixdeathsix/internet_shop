import React, { useState, useContext } from 'react'
import { Button, Form, Modal, Dropdown, Row } from 'react-bootstrap'
import DropdownItem from 'react-bootstrap/esm/DropdownItem';
import DropdownMenu from 'react-bootstrap/esm/DropdownMenu';
import DropdownToggle from 'react-bootstrap/esm/DropdownToggle';
import { createType, deleteType } from '../../services/ApiProvider';
import { Context } from '../../index'
import { observer } from 'mobx-react-lite';

export const CreateType = observer(({show, onHide}) => {

  const {device} = useContext(Context)

  const [value, setValue] = useState('');

  function addType() {
    createType({name: value}).then(data => {
      setValue('');
      onHide();
    })
  }

  function delType() {
    deleteType(device.selectedType.id).then(data => {
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
          Добавить тип
        </Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Form className='d-flex gap-2 mb-2'>
          <Form.Control 
            placeholder='Введите название типа'
            value={value}
            onChange={e => setValue(e.target.value)}
          />
          <Button variant='success' onClick={addType}>Добавить</Button>
        </Form>
        <Form className='d-flex gap-2'>
          <Dropdown className="w-100">
            <DropdownToggle variant='outline' className="w-100">{device.selectedType.name || 'Выберите тип'}</DropdownToggle>
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
          <Button variant='danger' onClick={delType}>Удалить</Button>
        </Form>
      </Modal.Body>
    </Modal>
  )
})
