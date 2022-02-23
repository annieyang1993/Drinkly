import { Link } from 'react-router-dom';
import React, { useContext, useState, useMemo, useEffect} from 'react';
// import HomePageContainer from './../homepage/homepage_container';
import AuthContext from '../../../context/Context'

function LoginForm () {
    const authContext = useContext(AuthContext);
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [errors, setErrors] = useState(Object.values(authContext.currentRestaurant).length!== 0 ? 'Please log in first to add items to cart.' : authContext.locationSearchBool === true ? 'Please log in first to search by location.' : '');

    const login = async (user) => (
    $.ajax({
        method: 'POST',
        url: '/api/session',
        data: { user }
    })
    );

    const update = (field) => {
        return e => this.setState({
            [field]: e.currentTarget.value
        });
    }

    const handleSubmit =async (e) =>{
        e.preventDefault();
        const user = {username: username, password: password}
        try{
            const output = await login(user);
            console.log(output);
            if (Object.keys(authContext.currentRestaurant).length!==0){
                console.log("HERE1", authContext.currentRestaurant)
                window.location.href = `/#/api/restaurants/${authContext.currentRestaurant.id}`
            }
            const loc = await authContext.getLocation(output.id);
            authContext.setSession(output.session_token);
            authContext.setUser({[output.session_token]: output});
            authContext.setLocation({lat: Number(loc['latitude']), lng: Number(loc['longitude'])});
            authContext.setAddress({category: loc['category'], latitude: Number(loc['latitude']), longitude: Number(loc['longitude'])})
            authContext.setInnerAddress(loc['category']);
            var savesTemp = await authContext.getSaves(output.id);
            authContext.setSaves(Object.values(savesTemp));

            authContext.setLoaded(true);
            authContext.setLoaded2(true);
            
            window.currentUser = output;

        } catch (error){
            setErrors('Invalid username/password combo, please try again.')
        }
 
    }

    function RenderErrors(){
        return (
            <ul className="errors">
                {errors}
            </ul>
        );
    }


        return (
            <div className="login-form-large-container">
            <div className="login-form-container">
                <Link to="/" ><img className="logo-blue" src="/Drinkly-logo-official.png" /></Link>
                <div className="topLine"></div>
                <form onSubmit={(e)=>handleSubmit(e)} className="login-form-box">
                    <div className = "signInText">Sign In</div>
                    <br /><div className= "test" onClick={()=>{setErrors('')}}>
                            <div className="login-prompt" >New to Drinkly? </div><Link to="/signup">Sign up</Link></div>
                    
                    <div className="login-form">
                        <br />
                            <label>Username: <br />
                            <input type="text"
                                value={username}
                                onChange={(e)=>{setUsername(e.target.value)}}
                                className="login-input"
                            />
                        </label>
                            <br /> <br />
                        <label>Password: <br/>
                            <input type="password"
                                value={password}
                                onChange={(e)=>{setPassword(e.target.value)}}
                                className="login-input"
                            />
                            </label> <br /> 
                        <br />
                        <input className="session-submit" type="submit" value={'Login'} />
                        <input onClick={()=>{setUsername('demouser@gmail.com'); setPassword('demotest')}} className="session-submit" type="submit" value={'Demo User'}/> 
                    <RenderErrors/>
                    </div>
                </form>

                
            {/* <FooterContainer/> */}
                
            </div>
                 
            </div>
        );
    
}

export default LoginForm;
