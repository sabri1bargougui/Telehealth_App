import React, { Component } from 'react';

class Footer extends Component {
    render() {
        return (
            <MDBFooter color='indigo' className="foofter">
                <p className='footer-copyright mb-0 py-3 text-center'>
                    &copy; {new Date().getFullYear()} Copyright:
              <a href='https://www.facebook.com/sabri.benmohamed.7355'> Sabri Bargouugi </a>
                </p>
            </MDBFooter>
        );
    }
}

export default Footer;











