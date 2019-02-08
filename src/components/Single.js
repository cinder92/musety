import React from 'react'
import {
    View,
    Text,
    Image,
    StyleSheet,
    TouchableOpacity
} from 'react-native'
import {Icon} from '../components'
import { colors, measures } from '../settings';

const Single = (props) => {
    return(
        <TouchableOpacity onPress={() => props.onPress()}>
            <View style={styles.container}>
                <View style={styles.row}>
                    <Text style={{color:colors.black,fontSize:12,fontWeight:"bold"}}>{props.type}</Text>
                    <Icon name={props.icon} color={colors.black} size={18} />
                </View>
                <Image 
                    source={props.image} 
                    resizeMode={"contain"}
                    style={{width : "100%", height : props.height,backgroundColor:colors.gray}}    
                />
                <View>
                    <Text style={{color:colors.black,fontSize:16,fontWeight:"bold"}}>{props.title}</Text>
                    <Text style={{fontSize:14}}>{props.price}</Text>
                </View>
            </View>
        </TouchableOpacity>
    )
}

const styles = StyleSheet.create({
    container : {
        backgroundColor : colors.gray,
        width : (measures.width/2) - 26,
        padding : 10,
        marginBottom : 15
    },

    row : {
        flexDirection : "row",
        alignItems : "center",
        justifyContent : "space-between",
    }
})

export default Single