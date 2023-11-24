class NamedRoutes {
  // ------------------------------------- Root path ----------------------------------
  static const notFound = (path: '/not-found', name: 'not-found-screen');
  static const home = (path: '/home', name: 'home-screen');
  static const signIn = (path: '/sign-in', name: 'sign-in-screen');
  static const signUp = (path: '/sign-up', name: 'sign-up-screen');
  static const splash = (path: '/splash', name: 'splash-screen');
  static const createStory =
      (path: '/create-story', name: 'create-story-screen');

  // ------------------------------------- Child path ----------------------------------
  static const detailStory =
      (path: 'detail-story/:id', name: 'detail-story-screen');

  static const camera = (path: 'camera', name: 'camera-screen');
  static const storyMap = (path: 'story-map', name: 'story-map-screen');
  static const storyDetailMap =
      (path: 'story-map-detail', name: 'story-map-detail-screen');
}
