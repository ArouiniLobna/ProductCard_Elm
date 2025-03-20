# Bellroy Product Card Component

This project demonstrates a product card component built with Elm and integrated into an Astro application, similar to those found on bellroy.com.

Note: this is my 1st time working with Elm and Astro, so tried my best cover as much possible using my experience within other framework and libraries like Reactjs and next.js

## Project Structure

```
├── src/
│   ├── components/
│   │   └── ProductCardWrapper.astro   # Astro wrapper for the Elm component
│   ├── elm/
│   │   ├── Main.elm                   # Entry point for Elm application
│   │   └── ProductCard.elm            # Product card component implementation
        └── ProductCardApi.elm         # handles all API-related functionality including HTTP requests and decoders
        └── ProductCardBadge.elm       # A simple, reusable badge component that can be used to display special info like Best seller
        └── ProductCardColorOptions.elm       # rendering the color option buttons for the product
        └── ProductCardImage.elm       # rendering the product image with proper hover effects and optional badge.
        └── ProductCardTypes.elm       # all the type definitions used across the ProductCard components.
        └── ProductCardView.elm        # rendering of the product card and its subcomponents
│   ├── layouts/
│   │   └── Layout.astro               # Main layout component
│   ├── pages/
│   │   └── index.astro                # Main page displaying the product card
│   └── styles/
│       └── product-card.css           # Styles for product card component
├── public/
│   ├── api/
│   │   └── product/
│   │       └── example.json           # Mock API endpoint for product data
│   └── images/
│       └── products/                  # Product images
├── tests/
│   └── ProductCardTests.elm           # Tests for the ProductCard component
├── astro.config.mjs                   # Astro configuration
├── elm.json                           # Elm dependencies
├── package.json                       # Project dependencies
└── README.md                          # Project documentation
```

## Installation

1. Install dependencies:

```bash
# Install Node.js dependencies
npm install

# Install Elm dependencies
npx elm install elm/http
npx elm install elm/json
```

2. Set up Elm with Astro:

```bash
# Install Astro Elm integration
npm install astro-elm
```

3. Update `astro.config.mjs`:

```javascript
import { defineConfig } from "astro/config";
import elm from "astro-elm";

export default defineConfig({
  integrations: [elm()],
});
```

## Development

Start the development server:

```bash
npm run dev
```

## Building for Production

```bash
npm run build
```

## Running Tests

```bash
npx elm-test
```

## Key Features

- Functional programming using Elm
- Type-safe code
- Clean, maintainable CSS using BEM methodology
- Responsive design
- Accessibility features
- Integration with Astro
- Comprehensive testing

## Accessibility Features

This component implements various accessibility features:

- Proper semantic HTML elements
- ARIA attributes for interactive elements
- Keyboard navigation support
- Focus management
- Color contrast compliance
- Screen reader friendly content
- Support for high contrast mode

## Performance Considerations

- Lazy-loaded images
- Minimal dependencies
- Optimized rendering
- Efficient state management
