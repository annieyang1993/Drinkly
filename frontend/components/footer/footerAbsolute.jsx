import React from 'react';
import {Link} from 'react-router-dom';

const FooterAbsolute = () => {


        return (
        <div className="footer">
            <div className="second">
                <h1 className="firstHeader">Get to know Annie Yang</h1> <br /> 
                <a className="linkedin" href="https://www.linkedin.com/in/annie-yang-48780175/">Linkedin 
                 <img className="logo" src="/linkedin.png" /></a> <br /> <br />
                <a className="github" href="https://github.com/annieyang1993?tab=repositories">Github
                                 <img className="logo" src="/github.png" /></a> <br /> <br />

            </div>
        </div>
    )
}

export default FooterAbsolute;