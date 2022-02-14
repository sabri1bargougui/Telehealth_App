import React, { Component } from 'react';
import avatar from "../../assets/marc.jpg";
import { MDBBtn, MDBCard, MDBCardBody, MDBCardImage, MDBCardTitle, MDBCardText, MDBCol, MDBRow } from 'mdbreact';
import './profile.css';
import jwtDecode from 'jwt-decode';

class Profile extends Component {
    state = {};

    submitHandler = event => {
        event.preventDefault();
        event.target.className += " was-validated";
    };

    changeHandler = event => {
        this.setState({ [event.target.name]: event.target.value });
    };
    componentDidMount() {
        try {
            const jwt = localStorage.getItem("token");
            const user = jwtDecode(jwt);
            this.setState({ user });
        } catch (e) {

        }
    };
    render() {
        return (
            <div className="containerr">
                {this.state.user && (
                    <MDBCol style={{ maxWidth: "22rem" }}>
                        <MDBCard style={{ width: "70rem" }}>
                            <MDBCardImage className="img-fluid rounded-circle userimage"
                                src={avatar}
                                waves />
                            <MDBCardBody  >
                                <MDBCardTitle>{this.state.user.name + ' ' + this.state.user.lastname}</MDBCardTitle>
                                <MDBCardText>Administrateur de l'application TeleMedicine.</MDBCardText>
                                <form
                                    className="needs-validation"
                                    onSubmit={this.submitHandler}
                                    noValidate >
                                    <MDBRow>
                                        <MDBCol md="4" className="mb-3">
                                            <label
                                                htmlFor="defaultFormRegisterNameEx"
                                                className="grey-text" >
                                                Prénom
                                            </label>
                                            <input
                                                value={this.state.user.name}
                                                name="fname"
                                                onChange={this.changeHandler}
                                                type="text"
                                                id="defaultFormRegisterNameEx"
                                                className="form-control"
                                                placeholder="First name"
                                                required
                                            />
                                            <div className="valid-feedback">Looks good!</div>
                                        </MDBCol>
                                        <MDBCol md="4" className="mb-3">
                                            <label
                                                htmlFor="defaultFormRegisterEmailEx2"
                                                className="grey-text">
                                                Nom
                                       </label>
                                            <input
                                                value={this.state.user.lastname}
                                                name="lname"
                                                onChange={this.changeHandler}
                                                type="text"
                                                id="defaultFormRegisterEmailEx2"
                                                className="form-control"
                                                placeholder="Last name"
                                                required
                                            />
                                            <div className="valid-feedback">Looks good!</div>
                                        </MDBCol>
                                        <MDBCol md="4" className="mb-3">
                                            <label
                                                htmlFor="defaultFormRegisterConfirmEx3"
                                                className="grey-text"  >
                                                Email
                                      </label>
                                            <input
                                                value={this.state.user.email}
                                                onChange={this.changeHandler}
                                                type="email"
                                                id="defaultFormRegisterConfirmEx3"
                                                className="form-control"
                                                name="email"
                                                placeholder="Your Email address"
                                            />
                                            <small id="emailHelp" className="form-text text-muted">
                                                Nous ne partagerons jamais votre e-mail avec qui que ce soit.

                                      </small>
                                        </MDBCol>
                                    </MDBRow>

                                    <MDBBtn color="primary" type="submit">
                                        Edite Profil
                                  </MDBBtn>
                                </form>

                            </MDBCardBody>
                        </MDBCard>
                    </MDBCol>

                )}

            </div>
        );
    }
}

export default Profile;