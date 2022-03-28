import { observer } from 'mobx-react-lite'
import React, { useContext, useEffect, useState } from 'react'
import { Col, Container, Row, Spinner } from 'react-bootstrap'
import { Context } from '..'
import { BrandBar } from '../components/BrandBar'
import { DeviceList } from '../components/DeviceList'
import { PaginationList } from '../components/Pagination'
import {Search} from '../components/Search'
import { TypeBar } from '../components/TypeBar'
import { fetchTypes, fetchBrands, fetchDevices } from '../services/ApiProvider'

export const ShopPage = observer(() => {

  const {device} = useContext(Context) 

  useEffect(() => {
    fetchTypes().then((data) => {
      device.setTypes(data)
    })
    fetchBrands().then((data) => {
      device.setBrands(data)
    })
  }, [])

  useEffect(() => {
    fetchDevices(device.selectedType.id, device.selectedBrand.id, device.page, device.limit).then((data) => {
      device.setDevices(data.rows)
      device.setTotalCount(data.count)
    })
    
  }, [device.page, device.selectedType, device.selectedBrand])
  

  return (
    <Container className='mt-3'>
      <Row className='justify-content-center'>
        <Search /> 
        <Col md={3}>
          <TypeBar />
        </Col>
        <Col md={9}>
          <BrandBar />
          <DeviceList />
          <PaginationList />
        </Col>
      </Row>
    </Container>
  )
})