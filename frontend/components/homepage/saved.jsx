import { Link } from 'react-router-dom';
import React, { useContext, useState, useMemo, useEffect} from 'react';
// import HomePageContainer from './../homepage/homepage_container';
import AuthContext from '../../../context/Context'
// import * as APIUtil from '../../util/session_api_util';
// import header from './../../../public/5452421.jpg';
// import FooterContainer from '../footer/footer';
import SimpleMap from './map.jsx'
// import SimpleMapLocation from './map-location.jsx'
// import RestaurantListView from './restaurant_list_view.jsx'
import {AiOutlineSearch} from 'react-icons/ai'
import {FaShoppingCart} from 'react-icons/fa'
import {GoLocation} from 'react-icons/go'
import {BiSearch} from 'react-icons/bi'
import Geocode from "react-geocode";
import GoogleMapReact from 'google-map-react';
import {BiCurrentLocation} from 'react-icons/bi'
import {FaWalking} from 'react-icons/fa'
import {BsDot} from 'react-icons/bs'
import {AiFillStar, AiOutlineHeart, AiOutlineMenu, AiOutlineClose} from 'react-icons/ai'
import {BiLogOutCircle} from 'react-icons/bi'
import Header from '../header/header'
// import {ImMenu} from 'react-icons/im'
// import { tupleTypeAnnotation } from '@babel/types';
// import Carousel from './carousel.jsx'
const AnyReactComponent = ({ text }) => <div>{text}</div>;

// set Google Maps Geocoding API for purposes of quota management. Its optional but recommended.
Geocode.setApiKey("AIzaSyB9fx4NpEW1D65AvgJjzY-npVoFUf17FRg");

// set response language. Defaults to english.
Geocode.setLanguage("en");

// set response region. Its optional.
// A Geocoding request with region=es (Spain) will return the Spanish city.
Geocode.setRegion("es");

// set location_type filter . Its optional.
// google geocoder returns more that one address for given lat/lng.
// In some case we need one address as response for which google itself provides a location_type filter.
// So we can easily parse the result for fetching address components
// ROOFTOP, RANGE_INTERPOLATED, GEOMETRIC_CENTER, APPROXIMATE are the accepted values.
// And according to the below google docs in description, ROOFTOP param returns the most accurate result.
Geocode.setLocationType("ROOFTOP");

// Enable or disable logs. Its optional.
Geocode.enableDebug();

//<td class="headerImg"><%=image_tag("/coffeeHeaderImg.png", width: '100%', height: '600', padding: '0', margin: '0-auto', 'object-fit': 'cover')%></td>

export default function Saved(){
    const authContext = useContext(AuthContext);
    const [address, setAddress] = useState(authContext.address.category);
    const [locationBool, setLocationBool] = useState(false);
    const [location, setLocation] = useState(authContext.location[0]);
    const [restaurantListCount, setRestaurantListCount] = useState(0);
    const [restaurantList, setRestaurantList] = useState([]);
    const [tags, setTags] = useState({});



    useEffect(()=>{
        setAddress(authContext.address.category)
        //getLocation();
        
    }, [])

    const save = (user_id, restaurant_id) => {
    return (
        $.ajax({
        method: 'POST',
        url: `/api/saves`,
        data: {user_id: Number(user_id), restaurant_id: Number(restaurant_id)}
        })
    )
    }

    const deleteSave = (user_id, restaurant_id) => {
    return (
        $.ajax({
        method: 'DELETE',
        url: `/api/saves/${user_id}`,
        data: {user_id: Number(user_id), restaurant_id: Number(restaurant_id)}
        })
    )
    }

    const handleSave = async (user_id, restaurant_id) => {
      if (authContext.saves.includes(Number(restaurant_id))){
        var deleteTemp = await deleteSave(user_id, restaurant_id);
        authContext.setSaves(Object.values(deleteTemp));
      } else{
        var addTemp = await save(user_id, restaurant_id);
        authContext.setSaves(Object.values(addTemp));
      }
    }

//     //   update(field) {
//     //     return e => setState({
//     //       [field]: e.currentTarget.value
//     //     });
//     //   }

    const rad = (x)=> {
        return x * Math.PI / 180;
    };

    const getDistance = (p1, p2) => {
        var R = 6378137; // Earth’s mean radius in meter
        var dLat = Number(rad(Number(p2.lat) - Number(p1.lat)));
        var dLong = Number(rad(Number(p2.lng) - Number(p1.lng)));
        var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
            Math.cos(Number(rad(p1.lat))) * Math.cos(Number(rad(p2.lat))) *
            Math.sin(dLong / 2) * Math.sin(dLong / 2);
        var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        var d = R * c;
        return ((d/1000)/5*60).toFixed(0); // returns the distance in meter
    };


  function RenderRestaurantList(){
    
    var restaurantCount = 0;
    var restaurantListShow = []
    var mapsRestaurantList = []
    var tag_address = authContext.address;

    authContext.restaurantList.map((element, i) => {
          var distance = getDistance(authContext.location, {lat: authContext.restaurantHash[element]["latitude"], lng: authContext.restaurantHash[element]["longitude"]})
          var dollarSign = [];
          for (let i = 0; i<authContext.restaurantHash[element]["pricing"]; i++){
            dollarSign.push(<div className="dollar-sign">$</div>)
          }
          if (authContext.saves.includes(Number(element))){
            console.log(element);
            restaurantCount+=1;
          restaurantListShow.push(
          
          <div>
            <li key={i} className="innerContainerList" >
            <Link className = "restaurantLinks" onClick={()=>{authContext.setCurrentRestaurant(authContext.restaurantHash[element])}} to={`/api/restaurants/${authContext.restaurantHash[element]["id"]}`}>
            <div className="images">
            <img className = "img1" src={authContext.restaurantHash[element]["img1"]}/>
            <img className="img2" src={authContext.restaurantHash[element]["img2"]} />
            </div>
              <div className="cafeName"> 
              {console.log(authContext.saves)} 
              <AiOutlineHeart className="ready-in" color = {authContext.saves.includes(Number(element)) ? 'red' : 'gray'} onClick={()=>{handleSave(Object.values(authContext.user)[0]['id'], authContext.restaurantHash[element]['id'])}}/>
              </div>
             
            <div className="cafeDescription">{dollarSign}</div>
            <BsDot className="cafeDescription"/>
            <div className= "cafeDescription2">
            {authContext.restaurantHash[element]["description"]}
              </div>
            <div className="ready-in">Ready in {authContext.restaurantHash[element]["ready_in"]} min</div>
            <div className="cafeAddress">
                        {/* <GoLocation className= "flex-1"/> */}
                    <div className="flex-rating-word">{authContext.restaurantHash[element]["rating"]}</div>
                    <AiFillStar className= "flex-star"/>
                    <div className="flex-rating">{authContext.restaurantHash[element]["number_of_ratings"]} ratings</div>
                    <FaWalking size={15} className="walking-man"/>
                    <div className="distance">{distance} mins</div>
                    </div>
            
            </Link>
          </li>
            <div className="grayLine"></div>
          </div>
          )}})
    
    
    
    return (
      <div className = 'saved-restaurants'>
       <div className="cafes-title">
        <div className="cafes-title-innerContainer">My Saved Cafes ({restaurantCount})</div>
      </div>
     
     

      {restaurantListShow}

      
      
    
  
      </div>

    )

    //setRestaurantListCount(restaurantCount);

}

    return (
      <div className="homePageContainer">
        
          <div className="homepage-inner-container">
            
                  

            <Header/>


            
                    
                    <RenderRestaurantList/>
                    <div style={{height: '200px', width: '100%'}}>

                    

            </div>
       
          
          

          
          

          </div>
       
        
      </div>
    );
}



