import React,{Component} from 'react'
import {
    View,
    StyleSheet
} from 'react-native'
import {Header,Masonry,Single} from '../components'
import { colors, functions, measures } from '../settings';
import clock from '../assets/clock.png'
import chair from '../assets/chair.png'
import scissors from '../assets/scissors.png'
import lamp from '../assets/lamp.png'
import triangle from '../assets/triangle.png'
import taza from '../assets/taza.png'
import bottle from '../assets/bottle.png'

const columnWidth = ( measures.width - 10 ) / 2 - 10;

class Store extends Component{

    componentDidMount(){
        this.refs.masonry.addItemsWithHeight([
            { key:1, icon : "favorite-border", title:"Teapot", price : "$49.00", image : taza, type : "",height: columnWidth / 320 * ( Math.floor((Math.random() * 200) + 275) ), onPress:() => functions.navigateTo("Product")},
            { key:2, icon : "favorite", title:"Creative Chair", price : "$40.00", image : chair, type : "Sale",height: columnWidth / 320 * ( Math.floor((Math.random() * 200) + 275) ), onPress:() => functions.navigateTo("Product") },
            { key:3, icon : "favorite-border", title:"Flower Scissors", price : "$49.00", image : scissors, type : "",height: columnWidth / 320 * ( Math.floor((Math.random() * 200) + 275) ), onPress:() => functions.navigateTo("Product") },
            { key:4, icon : "favorite-border", title:"Clock", price : "$49.00", image : clock, type : "",height: columnWidth / 320 * ( Math.floor((Math.random() * 200) + 275) ), onPress:() => functions.navigateTo("Product") },
            { key:5, icon : "favorite", title:"Lamp", price : "$49.00", image : lamp, type : "",height: columnWidth / 320 * ( Math.floor((Math.random() * 200) + 275) ), onPress:() => functions.navigateTo("Product") },
            { key:6, icon : "favorite-border", title:"Triangles", price : "$49.00", image : triangle, type : "",height: columnWidth / 320 * ( Math.floor((Math.random() * 200) + 275) ), onPress:() => functions.navigateTo("Product") },
            { key:7, icon : "favorite-border", title:"Bottles", price : "$49.00", image : bottle, type : "",height: columnWidth / 320 * ( Math.floor((Math.random() * 200) + 275) ), onPress:() => functions.navigateTo("Product") }
        ]);
    }

    render(){
        return(
            <View style={styles.container}>
                <Header 
                    title={"STORE"}
                    leftButtons={[{
                        icon : "arrow-back",
                        color : colors.black,
                        size : 28,
                        type : "circular",
                        onPress : () => {
                            functions.pop()
                        }
                    }]}
                />
                <Masonry
                    containerStyle={{paddingLeft:15,paddingRight:0}}
                    ref="masonry"
                    columns={2}
                    renderItem={(item) => <Single {...item} /> }
                />
            </View>
        )
    }
}

const styles = StyleSheet.create({
    container : {
        flex : 1,
        backgroundColor : colors.white
    }
})

export default Store