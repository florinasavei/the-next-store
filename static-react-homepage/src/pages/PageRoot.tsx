import { topRoutes } from '../routes'
import { Navbar } from './_common/navigation/Navbar'
import { Outlet } from 'react-router-dom'

export const PageRoot = () => {
  return (
    <div>
        <Navbar routes={topRoutes}/>
        <Outlet />
    </div>
  )
}
