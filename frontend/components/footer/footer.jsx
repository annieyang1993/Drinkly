import React from 'react';
import {Link} from 'react-router-dom';

const Footer = () => {


    return (
        <div className="footer">
            <div className="second">
                <div  className="social-text">Linkedin   Github</div>
                <div className="social-icons">
                <a className="linkedin" href="https://www.linkedin.com/in/annie-yang-48780175/" target="_blank">
                 <img className="logo" src="/linkedin.png" /></a> 
                <a className="github" href="https://github.com/annieyang1993?tab=repositories" target="_blank">
                                 <img className="logo" src="/github.png" /></a></div>

            </div>
        </div>
    )
}

export default Footer;