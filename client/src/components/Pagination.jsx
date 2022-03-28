import { observer } from 'mobx-react-lite'
import React, { useContext, useEffect } from 'react'
import Pagination from 'react-bootstrap/Pagination'
import { Context } from '.././index'

export const PaginationList = observer(() => {

  const {device} = useContext(Context)

  const pageCount = Math.ceil(device.totalCount / device.limit)
  const pages = []

  for (let i = 0; i < pageCount; i++) {
    pages.push(i+1)
  }

  return (
    <Pagination className='mt-3'>
      {pages.map(p => 
        <Pagination.Item
          key={p}
          active={device.page === p}
          onClick={() => device.setPage(p)}
        >
          {p}
        </Pagination.Item>
      )}
    </Pagination>
  )
})
