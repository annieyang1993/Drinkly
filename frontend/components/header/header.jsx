import { Link } from 'react-router-dom';
import React, { useContext, useState, useMemo, useEffect} from 'react';
import AuthContext from '../../../context/Context'
import Geocode from "react-geocode";
import {BiLogOutCircle, BiSearch} from 'react-icons/bi'
import {FaShoppingCart} from 'react-icons/fa'
import {AiFillStar, AiFillHeart, AiOutlineHeart, AiOutlineMenu, AiOutlineClose} from 'react-icons/ai'


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
const Header = () => {
    const authContext = useContext(AuthContext);
    const [address, setAddress] = useState(authContext.address.category);
    var number = 0;
    Object.values(authContext.cart).map((element, i)=>{
        number+=Number(element["quantity"])
    })

    useEffect(()=>{
        // setAddress(authContext.address.category);
    })

    const logout = () => {
    $.ajax({
        method: 'DELETE',
        url: '/api/session'
    })
    authContext.setUser(null);
    authContext.setSession(null);
    authContext.setCart({});
    authContext.setCartRestaurant({});
    authContext.setCurrentRestaurant({})
    authContext.setLoaded(false);
    authContext.setAddress({});
    authContext.setLocation({lat: 41.4216687, lng: -104.1715192 });
    authContext.setSaved([])
    window.location.href = "/#/";
    };
    const updateUserLocation = (user_id, location) => {
    console.log("USER ID", user_id)
    return (
        $.ajax({
        method: 'PATCH',
        url: `/api/locations/${user_id}`,
        data: {location}
        })
    )
    }

    const handleSubmit = (e) => {
        e.preventDefault();
            // const location = Object.assign({}, this.state.address);
            Geocode.fromAddress(address).then(
            (response) => {
                const { lat, lng } = response.results[0].geometry.location;
                //setting store location to lat long 
                window.location.href = "/#/homepage";
                authContext.setLocation({lat: lat, lng: lng})
                authContext.setAddress({category: address, latitude: lat, longitude: lng})
                updateUserLocation(authContext.user[authContext.session].id, {category: address, latitude: lat, longitude: lng})
                // this.props.updateUserLocation(this.props.currentUser.id, {category: this.state.address, latitude: lat, longitude: lng});
                
            },

            (error) => {
                alert("Please type in valid address")
                // this.setState({locationBool: true})
            }
        );
            
        }

        const fetchItems = (restaurantId) => {
        return (
            $.ajax({
            method: 'GET',
            url: `/api/restaurants/${restaurantId}/items`,
            })
        )
    }

    return (
        <div className = "homePageHeader">

                {authContext.session!== null ? <Link to="/"  className="header-button2" onClick={()=>{logout()}}><BiLogOutCircle color={'darkgray'} size={20}/></Link> : null}
                {Object.values(authContext.cart).length === 0 ? null : 
                
                <Link to={`/api/restaurants/${authContext.cartRestaurant["id"]}`} style={{textDecoration: 'none'}} onClick = {async ()=>{
                    var itemsTemp = await fetchItems(authContext.cartRestaurant.id);
                    authContext.setItems(itemsTemp);
                    authContext.setCurrentRestaurant(authContext.cartRestaurant)}} className="numberofItems"><FaShoppingCart className = "shoppingCart" color={'white'} size={15}/> {number}</Link>}
                
                <form onSubmit={(e)=>handleSubmit(e)} className="location">
                    <div className="location-input">
                    <BiSearch className="magnifying-glass" size={20}/>
              
                    <div className="location-input-text">
                    <label>
                    <input type="text"
                      value={address}
                      onChange={(e)=>setAddress(e.target.value)}
                      className="location-input-text-inner"
                      placeholder="Enter Location"
                      onClick={()=>{
                        //   setLocationDrop(true);
                      }} 
                      />
     
                      </label>
                      </div>

                
                  </div>
                </form>
                {authContext.session!== null ? <Link to={`/my-saved-cafes`} style={{textDecoration: 'none'}} className="numberofItems"> <AiFillHeart/> {Math.max(authContext.saves.length, 0)} </Link> : null}
                <img className="logo-home" src="/Drinkly-logo-official.png" onClick={()=>{window.location.href = "/#/homepage"}}/>
                
                </div>
    )
}

export default Header;               
                
                
                
