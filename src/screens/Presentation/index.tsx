import React from 'react';
import { Image, SafeAreaView, ScrollView, StatusBar, Text } from 'react-native';
import { styles } from '@src/screens/Presentation/index.styles';
import Card from '@components/Card';

const PresentationScreen: React.FunctionComponent = () => {
    return (
        <SafeAreaView style={styles.safeArea}>
            <StatusBar barStyle={'dark-content'} />
            <ScrollView style={styles.root}>
                <Image style={styles.logo} source={{ uri: 'https://antware.mx/logo/Antware%20logo.png' }} />
                <Card>
                    <Text style={[styles.title, styles.textCenter]}>React Native Scaffold</Text>
                    <Text style={[styles.subtitle]}>This project is developed with:</Text>
                    <Text style={[styles.text]}> ● Typescript</Text>
                    <Text style={[styles.text]}> ● Prettier</Text>
                    <Text style={[styles.text]}> ● ESLint</Text>
                    <Text style={[styles.text]}> ● Babel Plugin Module Resolver</Text>
                </Card>
                <Card>
                    <Text style={[styles.title, styles.textCenter]}>Developed By Irving Guerra</Text>
                    <Text style={[styles.subtitle, styles.textCenter]}>From Antware</Text>
                    <Text style={[styles.text, styles.textCenter]}>Enjoy this template</Text>
                </Card>
            </ScrollView>
        </SafeAreaView>
    );
};

export default PresentationScreen;
