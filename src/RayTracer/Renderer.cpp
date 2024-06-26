#include "Renderer.h"
#include "Walnut/Random.h"

namespace Utils
{
    static uint32_t ConvertToRGBA(const glm::vec4& color)
    {
        uint8_t r = (uint8_t)(color.r * 255.0f);
        uint8_t g = (uint8_t)(color.g * 255.0f);
        uint8_t b = (uint8_t)(color.b * 255.0f);
        uint8_t a = (uint8_t)(color.a * 255.0f);

        return (a << 24) | (b << 16) | (g << 8) | r;
    }
}

void Renderer::OnResize(uint32_t width, uint32_t height)
{
    if (m_FinalImage)
    {
        if (width == m_FinalImage->GetWidth() && height == m_FinalImage->GetHeight())
            return;

        m_FinalImage->Resize(width, height);
    }
    else
        m_FinalImage = std::make_shared<Walnut::Image>(width, height, Walnut::ImageFormat::RGBA);

    m_ImageData.reset(new uint32_t[width * height]);
}

void Renderer::Render()
{
    for (uint32_t y = 0; y < m_FinalImage->GetHeight(); y++)
        for (uint32_t x = 0; x < m_FinalImage->GetWidth(); x++)
        {
            glm::vec2 coord = { x / (float)m_FinalImage->GetWidth(), y / (float)m_FinalImage->GetHeight() };
            coord = coord * 2.0f - 1.0f; // -1 -> 1
            glm::vec4 color = PerPixel(coord);
            color = glm::clamp(color, glm::vec4(0.0f), glm::vec4(1.0f));
            m_ImageData[x + y * m_FinalImage->GetWidth()] = Utils::ConvertToRGBA(color);
        }

    m_FinalImage->SetData(m_ImageData.get());
}


glm::vec4 Renderer::PerPixel(glm::vec2 coord)
{
    glm::vec3 rayOrigin(0.0f, 0.0f, 1.0f);
    glm::vec3 rayDirection(coord.x, coord.y, -1.0f);
    float radius = 0.5f;

    float a = glm::dot(rayDirection, rayDirection);
    float b = 2.0f * glm::dot(rayOrigin, rayDirection);
    float c = glm::dot(rayOrigin, rayOrigin) - radius * radius;

    float discriminant = b * b - 4.0f * a * c;
    if (discriminant < 0.0f)
        return glm::vec4(0, 0, 0, 1);

    glm::vec3 sphereColor(1, 0, 1);
    
    float closestHit = (-b - glm::sqrt(discriminant)) / (2.0f * a);
    glm::vec3 closestHitPosition = rayOrigin + rayDirection * closestHit;

    // float FarestHit = (-b + glm::sqrt(discriminant)) / (2.0f * a);
    // glm::vec3 farestHitPosition = rayOrigin + rayDirection * FarestHit;

    glm::vec3 normal = glm::normalize(closestHitPosition);
    glm::vec3 ligthDirection = glm::normalize(glm::vec3(-1.0f));
    float reflextion = glm::max(glm::dot(normal, -ligthDirection), 0.0f);

    sphereColor = glm::vec3(1, 0, 1) * reflextion;

    return glm::vec4(sphereColor, 1);
}
