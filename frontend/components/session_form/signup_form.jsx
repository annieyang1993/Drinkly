import FooterContainer from './../footer/footer';
import { Link } from 'react-router-dom';
import React, { useContext, useState, useMemo, useEffect} from 'react';
// import HomePageContainer from './../homepage/homepage_container';
import AuthContext from '../../../context/Context'


function SignupForm(){
    const authContext = useContext(AuthContext);
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [first_name, setFirstName] = useState('');
    const [last_name, setLastName] = useState('');
    const [number, setNumber] = useState('');
    const [error, setError] = useState('');

    // constructor(props) {
    //     super(props);
    //     this.state = {
    //         username: '',
    //         password: '',
    //         first_name: '',
    //         last_name: '',
    //         number: ''

    //     };
    //     this.handleSubmit = this.handleSubmit.bind(this);
    // }

    // update(field) {
    //     return e => this.setState({
    //         [field]: e.currentTarget.value
    //     });
    // }

    const handleSubmit =async (e)=>{
        e.preventDefault();
        const user = {first_name: first_name, last_name: last_name, number: number, username: username, password: password}
        let output;
        try{
            output = await signup(user);
            
        } catch (error){
            setError('Please try again. Please ensure that your email has not been registered previously and that your password is longer than 6 characters.')
        } 
        if (Object.keys(authContext.currentRestaurant).length!==0){
                window.location.href = `/#/api/restaurants/${authContext.currentRestaurant.id}`
            }
        authContext.setSession(output.session_token);
        authContext.setUser({[output.session_token]: output});
        authContext.setLocation({lat: Number(37.757815), lng: Number(-122.5076403)});
        authContext.setAddress({category: 'san francisco', latitude: Number(37.757815), longitude: Number(-122.5076403)})
        authContext.setInnerAddress('san francisco');
        updateUserLocation(output.id, {user_id: output.id, address_1: 'san francisco', city: 'san francisco', state: 'california', country: 'united states', category: 'san francisco', latitude: Number(37.757815), longitude: Number(-122.5076403)})
        var savesTemp = await authContext.getSaves(window.currentUser.id);
        authContext.setSaves(Object.values(savesTemp));
        authContext.setLoaded(true);
        authContext.setLoaded2(true);
        window.currentUser = output;

    }

    const updateUserLocation = (user_id, location) => {
    console.log("USER ID", user_id)
    return (
        $.ajax({
        method: 'POST',
        url: `/api/locations`,
        data: {location}
        })
    )
    }

    const signup = user => (
    $.ajax({
        method: 'POST',
        url: '/api/users',
        data: { user }
    })
    );

    function RenderErrors() {
        return (
            <ul className="errors">
                {error}
                {/* {this.props.errors.map((error, i) => (
                    <li key={`error-${i}`}>
                        {error}
                    </li>
                ))} */}
            </ul>
        );
    }


        return (
            <div>
            <div className="login-form-container">
                <Link to="/" style={{marginTop: '20px'}}><img className="logo-blue" src="/Drinkly-logo-official.png" /></Link>
                <div className="topLine"></div>
                <form onSubmit={(e) => handleSubmit(e)} className="login-form-box">
                    <div className = "signInText">Sign Up</div>
                    <br /><div className= "test" onClick={()=>{setErrors('')}}>
                           <div className="login-prompt" > Already have an account? </div> <Link to='/login'>Log in</Link></div>
                    
                    <div className="login-form">
                        <br />
                        <div className = "name-line">
                        <label className="login-input-name-label-1">First Name <br />
                            <input type="text"
                                value={first_name}
                                onChange={(e)=>setFirstName(e.target.value)}
                                className="login-input-name1"
                            />
                        </label>
                        <label className="login-input-name-label-2">Last Name <br />
                            <input type="text"
                                value={last_name}
                                onChange={(e) => setLastName(e.target.value)}
                                className="login-input-name2"
                            />
                        </label>
                        </div>


                            <label>Email <br />
                            <input type="text"
                                value={username}
                                onChange={(e)=>{setUsername(e.target.value)}}
                                className="login-input"
                            />
                        </label>

                        <label>Mobile Number <br />
                            <input type="text"
                                value={number}
                                onChange={(e)=>setNumber(e.target.value)}
                                className="login-input"
                            />
                        </label>

                         
                        <label>Password <br/>
                            <input type="password"
                                value={password}
                                onChange={(e)=>setPassword(e.target.value)}
                                className="login-input"
                            />
                            </label> <br /> 
                        <br />
                        <input className="session-submit" type="submit" value={'Sign up'} />
                    <RenderErrors/>
                    </div>
                    
                </form>
                
                {/* <FooterContainer /> */}
            </div>
                
            </div>
        );
    
}

export default SignupForm;
