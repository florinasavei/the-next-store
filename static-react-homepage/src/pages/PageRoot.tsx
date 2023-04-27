import React from 'react'
import { Navbar } from './common/navigation/Navbar'
import { Outlet } from 'react-router-dom'

export const PageRoot = () => {
  return (
    <div>
        Welcome!
        <Navbar/>
        <Outlet />
    </div>
  )
}
