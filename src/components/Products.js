import React from 'react'
import {
    View,
    Image,
    StyleSheet,
    TouchableOpacity
} from 'react-native'
import {colors,measures} from '../settings'

const Product = (props) => {
    return(
        <TouchableOpacity onPress={() => props.onPress()}>
            <View style={styles.container}>
                <Image 
                    source={props.image}
                    resizeMode={"cover"}
                    style={{
                        width: props.fullWidth ? "100%" : (measures.width/2)-26,
                        height: props.fullHeight ? ((measures.width/2)-16) * 2 : (measures.width/2)-26
                    }}
                />
            </View>
        </TouchableOpacity>
    )
}

const Products = (props) => {
    return(
        <View>
            {props.type == "mode-1" && (
                <View style={styles.row}>
                    <View>
                        <Product 
                            image={props.data.find((item,i) => item.position == 0 ).image}
                            onPress={() => props.data.find((item,i) => item.position == 0 ).onPress()} />
                        <Product 
                            image={props.data.find((item,i) => item.position == 1 ).image}
                            onPress={() => props.data.find((item,i) => item.position == 1 ).onPress()}/>
                    </View>
                    <Product 
                        fullHeight
                        image={props.data.find((item,i) => item.position == 2 ).image}
                        onPress={() => props.data.find((item,i) => item.position == 2 ).onPress()}
                    />
                </View>
            )}

            {props.type == "mode-2" && (
                <View>
                    <Product fullWidth image={props.data.find((item,i) => item.position == 0 ).image}
                    onPress={() => props.data.find((item,i) => item.position == 0 ).onPress()}/>
                    <View style={styles.row}>
                        <Product image={props.data.find((item,i) => item.position == 1 ).image}
                        onPress={() => props.data.find((item,i) => item.position == 1 ).onPress()}/>
                        <Product image={props.data.find((item,i) => item.position == 2 ).image}
                        onPress={() => props.data.find((item,i) => item.position == 2 ).onPress()}/>
                    </View>
                </View>
            )}

            {props.type == "mode-3" && (
                <View>
                    <View style={styles.row}>
                        <Product image={props.data.find((item,i) => item.position == 0 ).image}
                        onPress={() => props.data.find((item,i) => item.position == 0 ).onPress()}/>
                        <Product image={props.data.find((item,i) => item.position == 1 ).image}
                        onPress={() => props.data.find((item,i) => item.position == 1 ).onPress()}/>
                    </View>
                    <View style={styles.row}>
                        <Product image={props.data.find((item,i) => item.position == 2 ).image}
                        onPress={() => props.data.find((item,i) => item.position == 2 ).onPress()}/>
                        <Product image={props.data.find((item,i) => item.position == 3 ).image}
                        onPress={() => props.data.find((item,i) => item.position == 3).onPress()}/>
                    </View>
                </View>
            )}
        </View>
    )
}

const styles = StyleSheet.create({
    container : {
        backgroundColor : colors.white,
        padding : 8,
        flex : 1
    },

    row : {
        alignItems : "center",
        flexDirection : "row",
        justifyContent : "space-between"
    }
})

export default Products