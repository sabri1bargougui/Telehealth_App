import React, { Component } from 'react';
import { MDBContainer, MDBBtn, MDBModal, MDBModalBody, MDBModalHeader, MDBModalFooter, MDBIcon, MDBInput, MDBCol } from 'mdbreact';
import { ToastContainer, toast } from 'react-toastify';
import * as adminservice from '../../Services/adminservice';

class DoctorForm extends Component {
    notify = () => toast.success("Doctor added Successfully !");

    state = {
        modal: false,
        data: { name: "", description: "", age: "", specialization: "" },
    }

    toggle = () => {
        this.setState({
            modal: !this.state.modal
        });
    }

    // add doctor function
    dosubmit = async () => {
        const response = await adminservice.adddoctor(this.state.data);
        this.toggle();
        this.notify();
    }

    //handel submit 
    handelsubmit = e => {
        e.preventDefault();
        e.target.className += " was-validated";
        this.dosubmit();

    }

    //handle change
    handelchange = ({ currentTarget: input }) => {
        const data = { ...this.state.data };
        data[input.name] = input.value;
        this.setState({ data });
    }

    render() {

        return (
            <MDBContainer>
                <MDBIcon
                    icon='address-card'
                    className='green-text'
                    size='2x'
                    style={{ cursor: 'pointer' }}
                    onClick={this.toggle}
                />
                <MDBModal isOpen={this.state.modal} toggle={this.toggle}>
                    <MDBModalHeader toggle={this.toggle}>Ajouter un Médecin</MDBModalHeader>
                    <MDBModalBody>

                        <form onSubmit={this.handelsubmit}>
                            <label htmlFor="name" className="grey-text">
                                Nom
                          </label>
                            <input type="text" id="name" className="form-control" name="name"
                                value={this.state.data.name}
                                onChange={this.handelchange}
                            />
                            <br />


                            <label htmlFor="age" className="grey-text">
                                age
                          </label>
                            <input type="text" id="age" className="form-control" name="age"
                                value={this.state.data.age}
                                onChange={this.handelchange}
                            />
                            <br />

                            <label htmlFor="specialization" className="grey-text">
                                specialization
                          </label>
                            <input type="text" id="specialization" className="form-control" name="specialization"
                                value={this.state.data.specialization}
                                onChange={this.handelchange}
                            />
                            <br />


                            <MDBInput type="textarea" label="Decription" rows="5" name="description"
                                value={this.state.data.description}
                                onChange={this.handelchange} />
                            <br />

                        </form>
                    </MDBModalBody>
                    <MDBModalFooter>
                        <MDBBtn color="secondary" onClick={this.toggle}>Close</MDBBtn>
                        <MDBBtn color="primary" onClick={this.handelsubmit}>Submit</MDBBtn>
                        <ToastContainer />
                    </MDBModalFooter>
                </MDBModal>
            </MDBContainer>
        );
    }
}

export default DoctorForm;