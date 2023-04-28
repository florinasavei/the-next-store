import { FeaturedProducts } from './sections/FeaturedProducts'
import { HomeBanner } from './sections/HomeBanner'

export const HomePage = () => {
    return (
        <div>
            <div className="bg-gray-100 min-h-screen">
                <div className="container mx-auto px-4 py-8">
                    <HomeBanner />
                    <FeaturedProducts />
                </div>
            </div>
        </div>
    )
}
