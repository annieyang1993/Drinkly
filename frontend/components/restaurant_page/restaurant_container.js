import { connect } from 'react-redux';
import Restaurant from './restaurant';
import { oneRestaurant, menu, getItem, modalStatus } from '../../actions/restaurant_actions';
import { logout } from '../../actions/session_actions';
import {getLocation, searchAddress, updateUserLocation} from '../../actions/session_actions';
import {receiveLocation} from '../../actions/greeting_actions';
import { addItemToCart, clearCartItems, clearState } from '../../actions/cart_actions';

const mapStateToProps = ({ session, entities: { address, users, restaurants, currentRestaurant, menu, currentItem, modalStatus, cart, location } }) => {
    return {
        location: location,
        currentUser: users[session.id],
        restaurants: restaurants,
        currentRestaurant: currentRestaurant,
        restaurantId: currentRestaurant["id"], 
        menuList: menu,
        currentItem: currentItem,
        modalStatus: modalStatus,
        cart: cart,
        address: address

    };
};

const mapDispatchToProps = dispatch => ({
    getCurrentRestaurant: (restaurantId) => dispatch(oneRestaurant(restaurantId)),
    menu: (restaurantId) =>dispatch(menu(restaurantId)),
    getItem: (restaurantId, itemId) => dispatch(getItem(restaurantId, itemId)),
    setModal: (bool) => dispatch(modalStatus(bool)),
    logout: () => dispatch(logout()),
  receiveLocation: (location) => dispatch(receiveLocation(location)),
  getLocation: (user_id) => dispatch(getLocation(user_id)),
  searchAddress: (address) => dispatch(searchAddress(address)),
  updateUserLocation: (user_id, location) => dispatch(updateUserLocation(user_id, location)),
  clearCartItems: ()=>dispatch(clearCartItems()),
  clearState: ()=> dispatch(clearState())


});

export default connect(
    mapStateToProps,
    mapDispatchToProps
)(Restaurant);