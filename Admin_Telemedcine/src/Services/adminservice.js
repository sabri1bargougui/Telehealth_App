import axios from 'axios';


export function adddoctor(doctor) {
    return axios.post("http://localhost:3000/admin/doctor", {
        name: doctor.name,
        description: doctor.description,
        age: doctor.age,
        specialization: doctor.specialization
    },
        {
            headers: {
                'x-access-token': localStorage.getItem("token")
            }
        }

    );
}




export default {
    adddoctor
};
