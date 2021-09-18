import React from 'react';
import { StyleSheet, View } from 'react-native';

export const styles = StyleSheet.create({
    container: {
        backgroundColor: 'white',
        borderRadius: 10,
        borderWidth: 1,
        borderColor: '#CACACA',
        margin: 16,
        marginTop: 0,
        padding: 16
    },
    shadow: {
        shadowColor: '#000',
        shadowOffset: {
            width: 0,
            height: 3
        },
        shadowOpacity: 0.29,
        shadowRadius: 4.65,

        elevation: 7
    }
});

const Card: React.FunctionComponent = (props) => {
    return <View style={[styles.container, styles.shadow]}>{props.children}</View>;
};

export default Card;
