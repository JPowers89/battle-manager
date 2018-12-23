Split(['#one', '#two'], {
  elementStyle: (dimension, size, gutterSize) => ({
      'flex-basis': `calc(${size}% - ${gutterSize}px)`,
  }),
  gutterStyle: (dimension, gutterSize) => ({
      'flex-basis':  `${gutterSize}px`,
  }),
});
