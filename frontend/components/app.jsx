import React from "react";
import { Provider } from 'react-redux';
import ReactDOM from 'react-dom'
import {
  Route,
  Redirect,
  Switch,
  Link,
  HashRouter
} from 'react-router-dom';
import { AuthRoute, ProtectedRoute } from '../util/route_util';
import GreetingContainer from './greeting/greeting';
import AuthContext from '../../context/Context'
import { useEffect, useState } from "react";

import SignUpFormContainer from './session_form/signup_form';
import LogInFormContainer from './session_form/login_form';
import HomePageContainer from './homepage/homepage';
import Saved from './homepage/saved';
import ThankYou from './homepage/thankyou';
import RestaurantPageContainer from './restaurant_page/restaurant';
import Modal from './restaurant_page/modal';
import EditModal from './restaurant_page/edit_modal';
import DeleteModal from './restaurant_page/delete_modal';

// import ThankYouContainer from './homepage/thankyou'

const App = () => {
  const [restaurantList, setRestaurantList] = useState([]);
  const [restaurantHash, setRestaurantHash] = useState({});
  const [session, setSession] = useState(null);
  const [user, setUser] = useState(null);
  const [address, setAddress] = useState({});
  const [location, setLocation] = useState({lat: 41.4216687, lng: -104.1715192 });
  const [innerAddress, setInnerAddress] = useState('');
  const [loaded, setLoaded] = useState(false);
  const [loaded2, setLoaded2] = useState(false);
  const [currentRestaurant, setCurrentRestaurant] = useState({});
  const [item, setItem] = useState({});
  const [modal, setModal] = useState(false);
  const [cart, setCart] = useState({});
  const [saves, setSaves] = useState([]);
  const [cartArray, setCartArray] = useState([]);
  const [cartRestaurant, setCartRestaurant] = useState(null);
  const [tyRestaurant, setTyRestaurant] = useState(null);
  const [tyCart, setTyCart] = useState({});
  const [items, setItems] = useState([]);
  const [deleteModal, setDeleteModal] = useState(false);
  const [editModal, setEditModal] = useState(false);
  const [editElementKey, setEditElementKey] = useState(null);
  const [locationSearch, setLocationSearch] = useState('');
  const [locationSearchBool, setLocationSearchBool] = useState(false);

    

  const getRestaurants = ()=>{
    return(
    $.ajax({
      method: 'GET',
      url: '/api/restaurants',
    }))
  }

  const getItem = async (restaurantId, itemId) => {
    var itemTemp = await (
      $.ajax({
        method: 'GET',
        url: `/api/restaurants/${restaurantId}/items/${itemId}`
      })
    )
    console.log(itemTemp);

    setItem(itemTemp);
  }

  const getLocation = (user_id) => {
    return (
        $.ajax({
        method: 'GET',
        url: `/api/locations/${user_id}`
        })
    )
    }

  const getSaves = (user_id) => {
    return (
        $.ajax({
        method: 'GET',
        url: `/api/saves`,
        data: {user_id: user_id}
        })
    )
  }



  useEffect(async()=>{
    var restaurants = await getRestaurants();
    setRestaurantHash(restaurants);
    setRestaurantList(Object.keys(restaurants));
    if (window.currentUser) {
      setSession(window.currentUser.session_token);
      setUser({[window.currentUser.session_token]: window.currentUser})
      var savesTemp = await getSaves(window.currentUser.id);
      setSaves(Object.values(savesTemp));
      setLocation({lat: window.currentUser['latitude'], lng: window.currentUser['longitude']});
      setAddress({category: window.currentUser['category'], latitude: window.currentUser['latitude'], longitude: window.currentUser['longitude']})
      
      var loc = await getLocation(window.currentUser.id);
      setLocation({lat: Number(loc.latitude), lng: Number(loc.longitude)})
      console.log({lat: loc.latitude, lng: loc.longitude});
      setAddress({category: loc.category, latitude: Number(loc.latitude), longitude: Number(loc.longitude)});
      setInnerAddress(loc.category)
      setLoaded(true);   
      setLoaded2(true);
    } 
    window.currentUser = user;
    setLoaded(true);   
    setLoaded2(true); 


  }, [])

  

  return(
  <div className="outerDiv">

    
    <AuthContext.Provider value={{restaurantList, setRestaurantList, restaurantHash, setRestaurantHash, session, setSession, user, setUser,
    address, setAddress, location, setLocation, innerAddress, setInnerAddress, getLocation, loaded, setLoaded, currentRestaurant, setCurrentRestaurant,
     cart, setCart, modal, setModal, item, setItem, getItem, cartArray, setCartArray, loaded2, setLoaded2, saves, setSaves, cartRestaurant, setCartRestaurant, items, setItems,
     tyRestaurant, setTyRestaurant, tyCart, setTyCart, getSaves, deleteModal, setDeleteModal,editModal, setEditModal, editElementKey, setEditElementKey,
     locationSearch, setLocationSearch, locationSearchBool, setLocationSearchBool}}>
       <DeleteModal/>
       <EditModal/>
       <Modal/>
      <Switch>
      <AuthRoute exact path="/login" component={LogInFormContainer} />
      <AuthRoute exact path="/signup" component={SignUpFormContainer} />
      <ProtectedRoute exact path="/homepage" component={HomePageContainer} />
      <ProtectedRoute exact path="/my-saved-cafes" component={Saved} />
      <ProtectedRoute exact path="/thank-you" component={ThankYou} />
      <AuthRoute exact path = "/" component={GreetingContainer}/>
      <Route path="/api/restaurants/" component={RestaurantPageContainer} />  
      {/* <Route path="/thank-you" component={ThankYouContainer} />  */}
    </Switch>
    </AuthContext.Provider>
   
  </div>
  )
};

export default App;