export const FeaturedProducts = () => {
    return (
        <>
            <h2 className="text-xl font-bold mb-4">Featured Products</h2>
            <ul className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                <li className="bg-white rounded-lg p-4 shadow-md">
                    <p className="text-lg font-bold mb-2">Cash Register Model A</p>
                    <p className="text-gray-500">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </li>
                <li className="bg-white rounded-lg p-4 shadow-md">
                    <p className="text-lg font-bold mb-2">Cash Register Model B</p>
                    <p className="text-gray-500">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </li>
                <li className="bg-white rounded-lg p-4 shadow-md">
                    <p className="text-lg font-bold mb-2">Cash Register Model C</p>
                    <p className="text-gray-500">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                </li>
            </ul>
            <button className="mt-8 bg-blue-500 text-white py-2 px-4 rounded-lg hover:bg-blue-600">Shop now</button>
        </>
    )
}
