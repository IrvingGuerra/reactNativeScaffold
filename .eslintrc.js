module.exports = {
  root: true,
  parser: '@typescript-eslint/parser',
  extends: ['@react-native-community', 'eslint-config-prettier'],
  plugins: ['prettier', 'react-native'],
  ignorePatterns: ['.eslintrc.js'],
  parserOptions: {
    ecmaVersion: 2018,
    sourceType: 'module',
    jsx: true,
    tsconfigRootDir: __dirname,
    project: './tsconfig.json'
  },
  rules: {
    'arrow-parens': 0,
    'no-console': 1,
    'no-empty': 1,
    'no-use-before-define': 'off',
    'jsx-no-lambda': 0,
    'jsx-boolean-value': 0,
    'prefer-const': 2,
    'react/prop-types': 0,
    'comma-dangle': ['error', 'never'],
    'no-shadow': 'off',
    'no-underscore-dangle': 0
  }
};
