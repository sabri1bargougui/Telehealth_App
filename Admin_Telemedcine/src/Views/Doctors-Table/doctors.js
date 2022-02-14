import React, { Component } from 'react';
import { MDBIcon, MDBDataTableV5 } from 'mdbreact';
import { ToastContainer, toast } from 'react-toastify';
import DoctorForm from './../../components/DoctorForm/doctorform';
import axios from 'axios';
import './doctor.css';

class Doctors extends Component {

    notify = () => toast.warn("Doctor deleted Successfully !");

    state = {
        doctors: [],
        tableRows: [],
    }

    // update componenet state 
    async componentDidMount() {
        await axios.get('http://localhost:3000/admin/doctor', {
            headers: {
                'x-access-token': localStorage.getItem("token")
            }
        })

            .then(response => response.data)

            .then(data => {

                this.setState({ doctors: data })

            })

            .then(async () => {

                this.setState({ tableRows: this.getdoctors() });

            });

    }

    //  get all doctors in the data base
    getdoctors = () => {
        let doctors = this.state.doctors.map((doctor) => {
            return (
                {
                    id: doctor._id,
                    name: doctor.name,
                    delete: <MDBIcon
                        icon='trash'
                        className='red-text'
                        size='1x'
                        style={{ cursor: 'pointer' }}
                        onClick={() => this.handeldelete(doctor._id)}
                    />,

                }
            )
        });

        return doctors;

    }

    // delete doctor
    handeldelete = async doctorId => {
        await axios.delete("http://localhost:3000/admin/doctor/" + doctorId, {
            headers: {
                'x-access-token': localStorage.getItem("token")
            }
        })
        this.setState((prev) => ({
            tableRows: prev.tableRows.filter(
                (row) => row.id !== doctorId
            )
        }));

        this.notify();
    };

    render() {
        const data = {
            columns: [
                {
                    label: 'ID',
                    field: 'id',
                    sort: 'asc',
                    width: 150
                },
                {
                    label: 'Nom',
                    field: 'name',
                    sort: 'asc',
                    width: 270
                },
                {
                    label: 'Supprimer',
                    field: 'delete',
                    sort: 'asc',
                    width: 200
                },

            ],
            rows: this.state.tableRows,



        };
        return (
            <div>
                <div className="doctor">
                    <p><strong>Ajouter</strong></p>
                    <DoctorForm />
                </div>

                <MDBDataTableV5 hover data={data} filter='name' proSelect searchTop searchBottom={false} />
                <ToastContainer />

            </div>
        );
    }
}

export default Doctors;