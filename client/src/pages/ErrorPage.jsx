import React from 'react'
import { Container } from 'react-bootstrap'

export default function ErrorPage() {
  return (
    <Container style={{height: window.innerHeight * 0.8}} className='d-flex justify-content-center align-items-center'>
      <p style={{fontSize: 48}}>404</p>
    </Container>
  )
}
