import React, { Component } from 'react';
import { MDBIcon, MDBDataTableV5 } from 'mdbreact';
import axios from 'axios';
import { ToastContainer, toast } from 'react-toastify';
import Analys from './../../components/Analys-Form/analys';
import './user.css';


class Users extends Component {
    notify = () => toast.warn(" User deleted Successfully !");

    state = {
        users: [],
        tableRows: [],
    }


    // handle update to the users list
    async componentDidMount() {
        await axios.get('http://localhost:3000/admin/users', {
            headers: {
                'x-access-token': localStorage.getItem("token")
            }
        }
        )
            .then(response => response.data)

            .then(data => {

                this.setState({ users: data })

            })

            .then(() => {

                this.setState({ tableRows: this.getusers() })

            });

    }
    // get all users and in the table
    getusers = () => {
        let users = this.state.users.map((user) => {
            return (
                {
                    id: user._id,
                    name: user.name + ' ' + user.lastname,
                    cin: user.cin,
                    delete: <MDBIcon
                        icon='trash'
                        className='red-text'
                        size='1x'
                        style={{ cursor: 'pointer' }}
                        onClick={() => this.handeldelete(user._id)}

                    />,
                    add: <Analys userId={user._id} />
                }
            )
        })

        return users;
    }

    // delete specific user
    handeldelete = async userId => {
        await axios.delete("http://localhost:3000/admin/users/" + userId, {
            headers: {
                'x-access-token': localStorage.getItem("token")
            }
        });
        this.setState((prev) => ({
            tableRows: prev.tableRows.filter(
                (row) => row.id !== userId
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
                    label: 'CIN',
                    field: 'cin',
                    sort: 'asc',
                    width: 200
                },
                {
                    label: 'Supprimer',
                    field: 'delete',
                    sort: 'asc',
                    width: 200
                },
                {
                    label: 'Ajouter une analyse',
                    field: 'add',
                    sort: 'asc',
                    width: 200
                },
            ],
            rows: this.state.tableRows,



        };

        return (
            <div>
                <MDBDataTableV5 hover data={data} filter='name' proSelect searchTop searchBottom={false} />
                <ToastContainer />


            </div>

        );
    }
}

export default Users;