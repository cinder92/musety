import React,{Component} from 'react'
import {
    View,
    StyleSheet,
    Text,
    TouchableOpacity,
    ScrollView
} from 'react-native';
import {Products,Header} from '../components'
import {functions,colors} from '../settings'

import clock from '../assets/clock.png'
import lamp from '../assets/lamp.png'
import triangle from '../assets/triangle.png'
import taza from '../assets/taza.png'
import bottle from '../assets/bottle.png'
import table from '../assets/table.png'

class Home extends Component{
    render(){
        return(
            <View style={styles.container}>
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