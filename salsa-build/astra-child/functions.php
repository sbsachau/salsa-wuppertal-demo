<?php
/**
 * Astra Child Theme — SalsaWuppertal.com
 */

add_action('wp_enqueue_scripts', function() {
    wp_enqueue_style('astra-parent-style', get_template_directory_uri() . '/style.css');
    wp_enqueue_style('astra-child-style', get_stylesheet_uri(), ['astra-parent-style'], '1.0.0');
});

add_action('wp_footer', function() { ?>
<script>
(function() {
    'use strict';
    var observer = new IntersectionObserver(function(entries) {
        entries.forEach(function(entry) {
            if (entry.isIntersecting) {
                entry.target.classList.add('sw-revealed');
                observer.unobserve(entry.target);
            }
        });
    }, { threshold: 0.1, rootMargin: '0px 0px -50px 0px' });
    function initReveal() {
        document.querySelectorAll('.elementor-widget-wrap > .elementor-widget')
            .forEach(function(el) { observer.observe(el); });
    }
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initReveal);
    } else { initReveal(); }
})();
</script>
<?php });

add_action('init', function() {
    register_nav_menus([
        'primary' => __('Hauptmenu', 'astra-child'),
        'footer'  => __('Footer-Menu', 'astra-child'),
    ]);
});

add_action('init', function() {
    remove_post_type_support('post', 'comments');
    remove_post_type_support('page', 'comments');
});
add_filter('comments_open', '__return_false', 20, 2);
add_filter('pings_open', '__return_false', 20, 2);
add_filter('excerpt_length', function() { return 20; });
