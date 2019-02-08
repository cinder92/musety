import React,{Component} from 'react'
import {
    View,
    Text,
    StyleSheet,
    ScrollView,
    Animated,
    Image,
    TouchableOpacity
} from 'react-native'
import {Header,Icon} from '../components'
import {colors,functions,measures} from '../settings'
import watch from '../assets/watch.png'

const itemHeight = (measures.height/2.4);

const Stars = () => {
    return(
        <View style={styles.row}>
            <Icon name="star" color={colors.black} size={16} />
            <Icon name="star" color={colors.black} size={16} />
            <Icon name="star" color={colors.black} size={16} />
            <Icon name="star" color={colors.black} size={16} />
            <Icon name="star-half" color={colors.black} size={16} />
        </View>
    )
}

const Quantity = () => {
    return (
        <View style={[styles.row,{width:(measures.width / 3),borderWidth:1,borderColor:colors.gray,padding:8}]}>
            <Icon name="remove" color={colors.black} size={28} />
            <Text>01</Text>
            <Icon name="add" color={colors.black} size={28} />
        </View>
    )
}

class Product extends Component{
    scrollY = new Animated.Value(0)

    state = {
        scrollParentEnabled : true
    }

    render(){
        const {scrollParentEnabled} = this.state;
        
        let position = Animated.divide(this.scrollY, itemHeight);

        const items = [0,1,2] //item fake data

        return(
            <View style={styles.container}>
                <Header 
                    leftButtons={[{
                        icon : "arrow-back",
                        size:28,
                        type:"circular",
                        color:colors.black,
                        onPress : () => {
                            functions.pop()
                        }
                    }]}
                    title={"DETAILS"}
                    rightButtons={[{
                        icon : "store",
                        size:28,
                        type:"circular",
                        color:colors.black,
                        onPress : () => {
                            functions.navigateTo("Store")
                        }
                    }]}
                />
                <ScrollView scrollEnabled={scrollParentEnabled}>
                    <View style={styles.slide}>
                        <ScrollView
                            pagingEnabled={true}
                            bounces={false}
                            showsVerticalScrollIndicator={false}
                            onScroll={Animated.event( // Animated.event returns a function that takes an array where the first element...
                                [{ nativeEvent: { contentOffset: { y: this.scrollY } } }] // ... is an object that maps any nativeEvent prop to a variable
                            )}
                            scrollEventThrottle={16}
                            onTouchStart={(ev) => { this.setState({scrollParentEnabled:false }) }}
                            onMomentumScrollEnd={(e) => { this.setState({ scrollParentEnabled:true }) }}
                            onScrollEndDrag={(e) => { this.setState({ scrollParentEnabled:true }) }}
                        >
                            <Image 
                                source={watch}
                                resizeMode={"contain"}
                                style={{height:itemHeight}}
                            />
                            <Image 
                                source={watch}
                                resizeMode={"contain"}
                                style={{height:itemHeight}}
                            />
                            <Image 
                                source={watch}
                                resizeMode={"contain"}
                                style={{height:itemHeight}}
                            />
                        </ScrollView>
                        <View style={styles.dots}>
                            {items && items.map((item,i) => {
                                let opacity = position.interpolate({
                                    inputRange: [i - 1, i, i + 1], // each dot will need to have an opacity of 1 when position is equal to their index (i)
                                    outputRange: [0.3, 1, 0.3], // when position is not i, the opacity of the dot will animate to 0.3
                                    extrapolate: 'clamp' // this will prevent the opacity of the dots from going outside of the outputRange (i.e. opacity will not be less than 0.3)
                                });

                                return(
                                    <Animated.View 
                                        key={i}
                                        style={[styles.dot,{opacity}]} />)
                            })}
                        </View>
                    </View>
                    <View style={styles.content}>

                        <View style={styles.row}>
                            <Text style={styles.title}>MADISON</Text>
                            <TouchableOpacity>
                                <Icon name="favorite-border" size={22} color={colors.black} />
                            </TouchableOpacity>
                        </View>

                        <View style={[styles.row,{marginTop : 20}]}>
                            <Text style={{fontWeight:"bold",color:colors.black}}>$ 125</Text>
                            <View style={styles.row}>
                                <Stars />
                                <Text style={{marginLeft:20}}>944 Reviews</Text>
                            </View>
                        </View>

                        <View style={{marginTop : 30}}>
                            <Text style={{lineHeight:28}}>
                                Make your casual style more fashionable with the Elegan Minimalist Leather Wristwatch!
                                The sleek look of the watch paired with its handcrafted leather band makes for
                                Make your casual style more fashionable with the Elegan Minimalist Leather Wristwatch!
                                The sleek look of the watch paired with its handcrafted leather band makes for
                                Make your casual style more fashionable with the Elegan Minimalist Leather Wristwatch!
                                The sleek look of the watch paired with its handcrafted leather band makes for...
                            </Text>
                        </View>

                        <View style={[styles.row,{marginTop:30,marginBottom:15}]}>
                            <Quantity />
                            <TouchableOpacity>
                                <View style={{width:(measures.width) - (measures.width / 2),padding:12,backgroundColor:colors.black}}><Text style={{color:colors.white,alignSelf:"center"}}>ADD TO CART</Text></View>
                            </TouchableOpacity>
                        </View>

                    </View>
                </ScrollView>
            </View>
        )
    }
}

const styles = StyleSheet.create({
    container : {
        flex:1,
        backgroundColor : colors.white
    },

    row : {
        alignItems : "center",
        justifyContent : "space-between",
        flexDirection : "row"
    },

    slide : {
        width : measures.width,
        height : itemHeight,
        alignItems : "center",
        justifyContent : "center",
        backgroundColor : colors.gray
    },

    content : {
        paddingTop:15,
        paddingLeft:15,
        paddingRight:15,
    },

    title : {
        fontWeight :"bold",
        fontSize : 21,
        color : colors.black
    },

    dots : {
        flexDirection : "column",
        alignItems : "center",
        justifyContent : "space-between",
        position :"absolute",
        right:15,
        top : itemHeight - (measures.height / 4),
        zIndex : 2
    },

    dot : {
        width : 10,
        height : 10,
        borderRadius : 5,
        backgroundColor :"#b7b7b7",
        marginTop : 10
    }
})

export default Product