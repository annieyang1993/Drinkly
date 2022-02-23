import React from 'react';
import AuthContext from '../../../context/Context'
import Header from '../header/header'
import { useEffect, useState , useContext} from 'react';
import { Link } from 'react-router-dom';


export default function ThankYou (){
  const authContext = useContext(AuthContext);
    const [address, setAddress] = useState('');
    const [locationDrop, setLocationDrop] = useState(false);
    const [location, setLocation] = useState({});
    const [items, setItems] = useState(authContext.items);

    return (
      <div className="homePageContainer">
        <Header/>
        
          <div className="homepage-inner-container">

            <div className = 'thank-you-text'>
            <div className="thank-you-inner">
              <div className = 'thank-you-order'>Thank you for your order!</div> <br/>
              <div style={{color: 'gray', width: '500px', marginLeft: '50px'}}>Your item(s): </div> <br/>
              {Object.values(authContext.tyCart).map((element, i)=>(
                    <li style={{color: 'gray', fontWeight: 'normal', fontStyle: 'italic', marginLeft: '10px', width: '500px', marginLeft: '50px'}} className="itemsInCart" key={i}>
                        <div className = "itemCartName">  {element["item_name"]}</div>
                    <div className = "individualCost"> {element["quantity"]} x $ {element["price"]}</div></li>

               ))} <br/><br/>
            
             <div style={{width: '100%', textAlign: 'center'}}>Please feel free to reach out at the links below if you have any questions!</div>
              
              <div className="social-links">
                <a className="social-ty" href="https://github.com/annieyang1993" target="_blank"><img className="social-ty" src={"/Github.png"}/></a>
                <a className="social-ty" href="https://www.linkedin.com/in/annie-yang-48780175/" target="_blank"><img className="social-ty" src={"/LinkedIn.png"}/></a>
              </div>
              <br/>
              {/* <Link style={{color: 'gray', textDecoration: 'none', marginTop: '20px', textAlign: 'center', marginLeft: '50%', transform: 'translate(-50%)'}} to="/homepage">Back to home ></Link> */}
              </div>
              </div>


              <img className = 'background-img' src={authContext.tyRestaurant["img1"]}/>

            <div className = "thank-you">
            <div className="before"></div>
            <div className="after"></div></div>

          </div>
       
        
      </div>
    );
}


