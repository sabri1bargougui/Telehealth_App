import React, { Component } from 'react';
import {
  MDBNavbar, MDBNavbarBrand, MDBNavbarNav, MDBNavItem, MDBNavLink, MDBNavbarToggler, MDBCollapse, MDBDropdown,
  MDBDropdownToggle, MDBDropdownMenu, MDBDropdownItem, MDBIcon, MDBFooter
} from "mdbreact";
import { BrowserRouter as Router } from 'react-router-dom';
import './App.css';
import Routes from './Routes';
import jwtDecode from 'jwt-decode';


class App extends Component {
  state = {
    isOpen: false
  };
  componentDidMount() {
    try {
      const jwt = localStorage.getItem("token");
      const user = jwtDecode(jwt);

      this.setState({ user });
    } catch (e) {

    }
  }

  toggleCollapse = () => {
    this.setState({ isOpen: !this.state.isOpen });
  }

  render() {
    return (
      <Router>
        <div className='flyout'>
          <MDBNavbar color="default-color" dark expand="md" user={this.state.user}>
            <MDBNavbarBrand>
              <MDBNavLink to="/" activeClassName="selected"> <strong className="white-text">TeleMedicine</strong></MDBNavLink>
            </MDBNavbarBrand>
            <MDBNavbarToggler onClick={this.toggleCollapse} />
            <MDBCollapse id="navbarCollapse3" isOpen={this.state.isOpen} navbar>
              <MDBNavbarNav left>
                {this.state.user && (
                  <React.Fragment>
                    <MDBNavItem active>
                      <MDBNavLink to="/" activeClassName="selected">Accueil</MDBNavLink>
                    </MDBNavItem>
                    <MDBNavItem>
                      <MDBNavLink to='/users' activeClassName="selected">UTILISATEURS</MDBNavLink>
                    </MDBNavItem>
                    <MDBNavItem>
                      <MDBNavLink to='/analys' activeClassName="active">Analyses</MDBNavLink>
                    </MDBNavItem>
                    <MDBNavItem>
                      <MDBNavLink to='/appoitments' activeClassName="active">rendez-vous en attente</MDBNavLink>
                    </MDBNavItem>
                    <MDBNavItem>
                      <MDBNavLink to='/appoitments/accepted' activeClassName="active">rendez-vous Acceptés</MDBNavLink>
                    </MDBNavItem>
                    <MDBNavItem>
                      <MDBNavLink to='/appoitments/completed' activeClassName="active">Rendez-vous terminés</MDBNavLink>
                    </MDBNavItem>
                    <MDBNavItem>
                      <MDBNavLink to='/doctors' activeClassName="active">Médecins</MDBNavLink>
                    </MDBNavItem>
                  </React.Fragment>
                )}

                {!this.state.user && (
                  <React.Fragment>
                    <MDBNavItem>
                      <MDBNavLink to='/login'>Connexion</MDBNavLink>
                    </MDBNavItem>
                    <MDBNavItem>
                      <MDBNavLink to='/register'>S'inscrire</MDBNavLink>
                    </MDBNavItem>
                  </React.Fragment>
                )}
              </MDBNavbarNav>
              <MDBNavbarNav right>
                {this.state.user && (
                  <MDBNavItem>
                    <MDBDropdown>
                      <MDBDropdownToggle nav caret>
                        <MDBIcon icon="user" />
                      </MDBDropdownToggle>
                      <MDBDropdownMenu className="dropdown-default">
                        <MDBDropdownItem>{this.state.user.name}</MDBDropdownItem>
                        <MDBNavLink to="/profile">
                          <MDBDropdownItem>
                            Profile
                        </MDBDropdownItem>
                        </MDBNavLink>
                        <MDBNavLink to="/logout">
                          <MDBDropdownItem>
                            Logout
                        </MDBDropdownItem>
                        </MDBNavLink>
                      </MDBDropdownMenu>
                    </MDBDropdown>
                  </MDBNavItem>)}
              </MDBNavbarNav>
            </MDBCollapse>
          </MDBNavbar>


          <Routes />

          <MDBFooter color='indigo'>
            <p className='footer-copyright mb-0 py-3 text-center'>
              &copy; {new Date().getFullYear()} Copyright:
              <a href='https://www.facebook.com/sabri.benmohamed.7355'> Sabri Bargouugi </a>
            </p>
          </MDBFooter>
        </div>
      </Router>
    );
  }
}

export default App;
