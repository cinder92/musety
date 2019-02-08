import React from 'react'
import {
    View,
    TouchableNativeFeedback,
    TouchableOpacity,
    Platform,
    StyleSheet
} from 'react-native'
import {Icon} from '../components'

const Button = Platform.select({
    ios : TouchableOpacity,
    android : TouchableNativeFeedback
})

const ButtonIcon = (props) => {
    return(
        <View style={[props.style, ((props.type && props.type == "circular") ? styles.circular : {},styles.button)]}>
            <Button onPress={() => props.onPress()} background={TouchableNativeFeedback.Ripple('#ccc', true)}>
                <View style={{backgroundColor:"transparent"}}>
                    <Icon name={props.icon} color={props.color} size={props.size}  />
                </View>
            </Button>
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