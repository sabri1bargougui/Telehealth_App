import React from 'react';
import { Route, Switch } from 'react-router-dom';
import Profile from './Views/Profile/profile';
import Users from './Views/Users-Table/users';
import Doctors from './Views/Doctors-Table/doctors';
import Dashboard from './Views/Dashboard/dashboard';
import Appoitment from './Views/Appoitments/appoitment';
import CompletedAppoitment from './Views/Appoitments/Compleeted_Apppointment';
import AcceptedAppointments from './Views/Appoitments/Accepted_Appointments';
import Login from './components/Login/Login';
import Signup from './components/Signup/signup';
import Logout from './components/logout/logout';
import Analyses from './Views/Analys-Table/Analys-Table';



class Routes extends React.Component {
  render() {
    return (
      <Switch>
        <Route exact path='/' component={Dashboard} />
        <Route exact path='/users' component={Users} />
        <Route exact path='/analys' component={Analyses} />
        <Route exact path='/doctors' component={Doctors} />
        <Route exact path='/profile' component={Profile} />
        <Route exact path='/appoitments' component={Appoitment} />
        <Route exact path='/appoitments/accepted' component={AcceptedAppointments} />
        <Route exact path='/appoitments/completed' component={CompletedAppoitment} />

        <Route exact path='/login' component={Login} />
        <Route exact path='/register' component={Signup} />
        <Route exact path='/logout' component={Logout} />

        <Route
          render={function () {
            return <h1>Not Found</h1>;
          }}
        />
      </Switch>
    );
  }
}

export default Routes;
