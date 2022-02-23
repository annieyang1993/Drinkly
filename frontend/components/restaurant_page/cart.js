import React, { useContext, useState, useMemo, useEffect} from 'react';
import { Link } from 'react-router-dom';
import AuthContext from '../../../context/Context'

export default function Cart(){
    const authContext = useContext(AuthContext);
    const [address, setAddress] = useState('');
    

    // update(field) {
    //     return e => this.setState({
    //         [field]: e.currentTarget.value
    //     });
    // }

    // handleClick() {
    //     this.props.setModal(false);


    // }

    // addToCart(item){
    //     this.props.addItemToCart(item);
    // }
    
    // renderModal(){
    //     return(
    //         <div className="ModalView">
    //             <img className="exitButton" onClick={()=>this.handleClick()} src="/x.png"/>
    //                 <div className="currentItemName">{this.props.currentItem["name"]}</div>
    //             <div className="currentItemDescription">{this.props.currentItem["description"]}</div>
    //                 <img className = "itemPicture" src={this.props.currentItem["img"]===null?
    //                     `/FillerLogo.png` :
    //                 `/Partners/${this.props.currentItem["img"]}.png`}/>
                    
    //            <div className = "addToCartTag"
    //            onClick={()=>this.addToCart(this.props.currentItem)}>Add to Cart - ${this.props.currentItem["price"]}</div>
    //         </div>)
        
    // }
    const handleClick = () => {
        authContext.setTyCart(authContext.cart);
        authContext.setTyRestaurant(authContext.cartRestaurant);
        authContext.setCart({});
        authContext.setCartRestaurant(null);

        //this.props.setModal(true);
        //console.log(id);
        //const {currentItem} = this.props;
    }
    
        var total = 0;
        Object.values(authContext.cart).forEach((e)=>{
            total+=e["price"]*e["quantity"];
        })
        console.log(total);
    
        if (Object.values(authContext.cart).length === 0){
            return (
                <div className="emptyCartDiv">
                    <img className="emptyCartImg" src="/foodIcon.png" />
                    <div className="emptyText">Your cart is empty
                        <div className="emptyText">Add items to get started</div>
                    </div>
                    
                </div>
            );
        } else{
            var cartRestaurantId = Object.values(authContext.cart)[0]["restaurant_id"];
           
            return (<div>
                <div className="cartTitle">Your Order</div>
                <div className="cartTitle" style={{color: 'gray', marginLeft: '10px', fontWeight: 'bold'}}>{authContext.cartRestaurant["name"]}</div>

            <Link to="/thank-you" onClick={()=>handleClick()} className = "checkOut2"><div className="checkOut">Proceed to checkout 
               <div className="totalCost">Total - ${total}</div></div></Link>
               <ul> {console.log(Object.values(authContext.cart))}
                {Object.keys(authContext.cart).map((element, i)=>(
                    <li className="itemsInCart" key={i}>
                        <div className = "itemCartName">  {authContext.cart[element]["item_name"]}</div>
                    <div className = "individualCost"> {authContext.cart[element]["quantity"]} x $ {authContext.cart[element]["price"]}</div>
                    <div style={{marginLeft: '10px', color: 'gray', fontSize: '13px', fontStyle: 'italic', width: '90%', alignItems: 'flex-end', display: 'flex', flexWrap: 'wrap'}}>
                    <div className = 'edit-delete' onClick={()=>{authContext.setEditElementKey(element); console.log(authContext.cart); console.log(element); authContext.setEditModal(true) }}>Edit</div>
                    <div className = 'edit-delete' style={{marginLeft: '10px'}} onClick={()=>{authContext.setEditElementKey(element); console.log(element); authContext.setDeleteModal(true) }}>Delete</div>
                    </div>
                    </li>

               ))}

                    

            </ul>
            <div className="filler"></div>
                <div className="clearCart" onClick={()=>{handleClick()}}> Empty cart </div>
            
            </div>)
        }

}

