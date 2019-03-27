import React,{Component} from 'react'
import {
    View,
    StyleSheet,
    Text,
    TouchableOpacity,
    findNodeHandle,
    ScrollView
} from 'react-native';
import {Products,Header} from '../components'
import {functions,colors} from '../settings'
import MercadoPago from 'react-native-mercado-pago'
import CrazyShadow from 'react-native-crazy-shadow'
import RNMaterialShadows from 'react-native-material-shadows';

import clock from '../assets/clock.png'
import lamp from '../assets/lamp.png'
import triangle from '../assets/triangle.png'
import taza from '../assets/taza.png'
import bottle from '../assets/bottle.png'
import table from '../assets/table.png'

class Home extends Component{

    componentDidMount(){
        //this.getPayment()
    }

    async getPayment(){

        let data = {
            items : [{
                "id": "12345",
                "picture_url": "http://lorempixel.com/250/250",
                "title": "Dummy Item",
                "description": "Multicolor Item",
                "category_id": "",
                "currency_id": "MXN",
                "quantity": 1,
                "unit_price": 10
            }],
            payer : {
                "name": "Dante Cervantes",
                "surname": "",
                "email": "cegodai@gmail.com",
                "date_created": "",
                "phone": {
                    "area_code": "",
                    "number": ""
                }
            }
        }

        const payment = await MercadoPago.startPayment(
            "TEST-5728883045341808-022807-f931bf278cdadba9b91c49100928226a-241794410",
            "TEST-dc0b51e0-0eb7-47ce-b145-5585a0189eb0",
            data
        );

        console.log(payment,'pago')
    }

    render(){
        return(
            <View style={styles.container}>
            <CrazyShadow 
            ref={ref => {}}
            style={{
                width : 216,
                height : 216,
            }} options={{
                shadowColor : "#AE4949",
                backgroundColor : "#ffffff",
                direction : "left",
                corner : 2,
                shadowRadius : 16
            }}>
                <Text style={{color:"red"}}>Here</Text>
            </CrazyShadow>


            <RNMaterialShadows 
            style={{
                width : 200,
                height : 200
            }} 
            padding={30}>
                <Text style={{color:"red"}}>Here</Text>
            </RNMaterialShadows>
            
                <Header 
                    title={"FAVOURITE"}
                    rightButtons={[
                        {
                            icon : "store",
                            size:28,
                            type : "circular",
                            color:colors.black,
                            onPress : () => {
                                functions.navigateTo("Store")
                            }
                        }
                    ]}
                />
                <ScrollView showsVerticalScrollIndicator={false}>
                    <Products 
                        type={"mode-1"}
                        data={[
                            { position : 0, image : lamp, onPress : () => {
                                functions.navigateTo("Product")
                            }},
                            { position : 1, image : taza, onPress : () => {
                                functions.navigateTo("Product")
                            } },
                            { position : 2, image : clock, onPress : () => {
                                functions.navigateTo("Product")
                            } },
                        ]}
                    />
                    <Products 
                        type={"mode-2"}
                        data={[
                            { position : 0, image : table, onPress : () => {
                                functions.navigateTo("Product")
                            } },
                            { position : 1, image : triangle, onPress : () => {
                                functions.navigateTo("Product")
                            } },
                            { position : 2, image : bottle, onPress : () => {
                                functions.navigateTo("Product")
                            } },
                        ]}
                    />
                    <Products 
                        type={"mode-3"}
                        data={[
                            { position : 0, image : lamp, onPress : () => {
                                functions.navigateTo("Product")
                            } },
                            { position : 1, image : lamp, onPress : () => {
                                functions.navigateTo("Product")
                            } },
                            { position : 2, image : lamp, onPress : () => {
                                functions.navigateTo("Product")
                            } },
                            { position : 3, image : lamp, onPress : () => {
                                functions.navigateTo("Product")
                            } },
                        ]}
                    />
                </ScrollView>
            </View>
        )
    }
}

const styles = StyleSheet.create({
    container : {
        flex : 1,
        backgroundColor : "white",
        paddingTop : 10,
        paddingLeft: 10,
        paddingRight : 10
    }
})

export default Home