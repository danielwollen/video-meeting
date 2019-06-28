module.exports = {
  /*
  ** Headers of the page
  */
  head: {
    title: 'Video Meeting',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: 'Video Meeting' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' },
      { rel: 'stylesheet', href: 'https://cdnjs.cloudflare.com/ajax/libs/uikit/3.1.5/css/uikit.min.css' }
    ]
  },
  /*
  ** Customize the progress bar color
  */
  loading: { color: '#0049ff' },
  /*
  ** Build configuration
  */
  build: {
    /*
    ** Run ESLint on save
    */
    extend (config, { isDev, isClient }) {
      if (isDev && isClient) {
        config.module.rules.push({
          enforce: 'pre',
          test: /\.(js|vue)$/,
          loader: 'eslint-loader',
          exclude: /(node_modules)/
        })
      }
    }
  },
  modules: [
    '@nuxtjs/axios',
    '@nuxtjs/auth'
  ],
  axios: {
    baseURL: 'localhost:8080/api/',
  },
  auth: {
    endpoints: {
      login:  { url: '/users/sign_in' },
      logout: { url: '/users/sign_out', method: 'delete' },
      user:   { url: '/users/current' }
    }
  }
}
