import React from 'react'
import {
    View,
    StyleSheet,
    Text,
    Platform
} from 'react-native'
import {ButtonIcon} from '../components'

const Header = (props) => {
    return(
        <View style={[styles.container,styles.row]}>
            <View style={styles.row}>
                {props.leftButtons && props.leftButtons.length > 0 && props.leftButtons.map((button,index) => (
                    <ButtonIcon 
                        key={index}
                        onPress={() => button.onPress()}
                        {...button}
                    />
                ))}
            </View>

            <View>
                <Text style={{fontWeight:"bold",fontSize:16,color:"black"}}>{props.title}</Text>
            </View>

            <View style={styles.row}>
                {props.rightButtons && props.rightButtons.length > 0 && props.rightButtons.map((button,index) => (
                    <ButtonIcon 
                        key={index}
                        onPress={() => button.onPress()}
                        {...button}
                    />
                ))}
            </View>
        </View>
    )
}

const styles = StyleSheet.create({
    container : {
        padding : 10,
        height : Platform.OS === "ios" ? 64 : 56,
        paddingTop : Platform.OS === "ios" ? 20 : 0
    },

    row : {
        flexDirection : "row",
        alignItems : "center",
        justifyContent : "space-between"
    }
})

export default Header