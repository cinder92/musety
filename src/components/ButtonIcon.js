import React from 'react'
import {
    View,
    TouchableNativeFeedback,
    StyleSheet
} from 'react-native'
import {Icon} from '../components'

const ButtonIcon = (props) => {
    return(
        <View style={[props.style, ((props.type && props.type == "circular") ? styles.circular : {},styles.button)]}>
            <TouchableNativeFeedback onPress={() => props.onPress()} background={TouchableNativeFeedback.Ripple('#ccc', true)}>
                <View style={{backgroundColor:"transparent"}}>
                    <Icon name={props.icon} color={props.color} size={props.size}  />
                </View>
            </TouchableNativeFeedback>
        </View>
    )
}

const styles = StyleSheet.create({
    circular : {
        borderRadius : 32/2,
        width : 32,
        height : 32
    },

    button :{
        alignItems : "center"
    }
})

export default ButtonIcon