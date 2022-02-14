import React, { Component } from 'react';
import { MDBCard, MDBCardBody, MDBCardTitle, MDBCardText, MDBRow, MDBCol, MDBIcon, MDBCarousel, MDBCarouselInner, MDBCarouselItem, MDBView } from 'mdbreact';
import './dashboard.css'
import cover1 from '../../assets/cover1.png'
import cover2 from '../../assets/cover2.png'
import cover3 from '../../assets/cover3.png'
class Dashboard extends Component {
    state = {}
    render() {
        return (
            <MDBRow>
                <MDBCol style={{ maxWidth: "100rem" }}>
                    <MDBCard reverse>
                        <MDBCardBody cascade className="text-center">
                            <MDBCardTitle>Welcome To</MDBCardTitle>
                            <h5 className="indigo-text"><strong>TeleMedicine</strong></h5>
                            <MDBCardText>Online doctor's office & medicine delivery</MDBCardText>
                            <a href="#!" className="icons-sm li-ic ml-1">
                                <MDBIcon fab icon="linkedin-in" /></a>
                            <a href="#!" className="icons-sm tw-ic ml-1">
                                <MDBIcon fab icon="twitter" /></a>
                            <a href="#!" className="icons-sm fb-ic ml-1">
                                <MDBIcon fab icon="facebook-f" /></a>
                        </MDBCardBody>
                        <MDBCarousel
                            activeItem={1}
                            length={3}
                            showControls={true}
                            showIndicators={true}
                            className="z-depth-1"
                        >
                            <MDBCarouselInner>
                                <MDBCarouselItem itemId="1">
                                    <MDBView>
                                        <img
                                            className="d-block w-100"
                                            src={cover1}
                                            alt="First slide"
                                        />
                                    </MDBView>
                                </MDBCarouselItem>
                                <MDBCarouselItem itemId="2">
                                    <MDBView>
                                        <img
                                            className="d-block w-100"
                                            src={cover2}
                                            alt="Second slide"
                                        />
                                    </MDBView>
                                </MDBCarouselItem>
                                <MDBCarouselItem itemId="3">
                                    <MDBView>
                                        <img
                                            className="d-block w-100"
                                            src={cover3}
                                            alt="Third slide"
                                        />
                                    </MDBView>
                                </MDBCarouselItem>
                            </MDBCarouselInner>
                        </MDBCarousel>

                    </MDBCard>
                </MDBCol>
            </MDBRow>


        );
    }
}

export default Dashboard;