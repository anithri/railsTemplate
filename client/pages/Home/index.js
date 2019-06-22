import cx from 'classnames'
import { NavLink } from 'react-router-dom'
import MainHeader from 'components/MainHeader'
import PropTypes from 'prop-types'
import React from 'react'
import styles from './styles.module.css'

class HomePage extends React.Component {
  render() {
    const { className } = this.props
    return (
      <main className={cx(className, styles.homePage)}>
        <MainHeader title="Welcome!" />
        <nav className="pageNav">
          <ul>
            <li>
              <NavLink to="/games" activeClassName="bg-white">
                A Link
              </NavLink>
            </li>
            <li>
              <NavLink to="/Oops" activeClassName="bg-white">
                Another Link
              </NavLink>
            </li>
          </ul>
        </nav>
      </main>
    )
  }
}

HomePage.propTypes = {
  className: PropTypes.string,
}

export default HomePage
